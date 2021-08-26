package com.softlab.okr.controller;

import com.github.pagehelper.PageInfo;
import com.softlab.okr.annotation.Auth;
import com.softlab.okr.exception.ApiException;
import com.softlab.okr.model.bo.RegisterBo;
import com.softlab.okr.model.bo.RoleResourceBo;
import com.softlab.okr.model.dto.RegisterDTO;
import com.softlab.okr.model.dto.ResourceDTO;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.dto.TagDTO;
import com.softlab.okr.model.entity.Resource;
import com.softlab.okr.model.entity.SignUp;
import com.softlab.okr.model.entity.Tag;
import com.softlab.okr.model.vo.BookVO;
import com.softlab.okr.model.vo.SignUpVO;
import com.softlab.okr.security.ApiFilter;
import com.softlab.okr.service.*;
import com.softlab.okr.utils.MD5Util;
import com.softlab.okr.utils.Result;
import com.softlab.okr.utils.ResultCode;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色
 *
 * @author RudeCrab
 */
@Validated
@RestController
@RequestMapping("/api/admin")
@Api(tags = "管理员操作")
@Auth(id = 2000, name = "管理员操作")
public class AdminController {

  @Autowired
  private UserEntityService userEntityService;

  @Autowired
  private RoleService roleService;

  @Autowired
  private ResourceService resourceService;

  @Autowired
  private SignUpService signUpService;

  @Autowired
  private TagService tagService;

  @Autowired
  private BookService bookService;

  @Autowired
  private RedisTemplate<String, Object> redisTemplate;


  private static final Map<String, String> map;

  static {
    map = new HashMap<String, String>();
    map.put("管理员", "admin");
    map.put("普通用户", "user");
  }

  @ApiOperation("注册用户")
  @PostMapping("register")
  @Auth(id = 1, name = "注册用户")
  public Result register(@Validated @RequestBody RegisterDTO registerDTO) {
    String password = MD5Util.string2MD5(registerDTO.getUsername());
    int roleId = roleService.getRoleId(registerDTO.getName());

    RoleResourceBo roleResourceBo = new RoleResourceBo(roleId,
        resourceService.getResourceIds(map.get(registerDTO.getName())));

    RegisterBo registerBo =
        new RegisterBo(
            null,
            registerDTO.getUsername(),
            password);

    if (userEntityService.getByUsername(registerDTO.getUsername()) == null) {
      userEntityService.register(registerBo, roleResourceBo, roleId);
      return Result.success("注册成功");
    } else {
      throw new ApiException(ResultCode.DATA_HAS_EXISTED);
    }
  }

  @ApiOperation("删除用户")
  @GetMapping("removeByUsername")
  @Auth(id = 2, name = "删除用户")
  public Result removeByUsername(
      @NotBlank(message = "username不能为空") @RequestParam("username") String username)
      throws Exception {
    System.out.println(username);

    if (userEntityService.getByUsername(username) != null) {
      userEntityService.removeByUsername(username);
      return Result.success("删除成功");
    } else {
      throw new ApiException(ResultCode.USER_LOGIN_ERROR);
    }
  }

  @ApiOperation("重载管理员资源")
  @GetMapping("reloadAdminRoleResource")
  @Auth(id = 3, name = "重载管理员资源")
  public Result reloadAdminRoleResource()
      throws Exception {
    RoleResourceBo roleResourceBo = new RoleResourceBo(1, resourceService.getResourceIds(
        "admin"));
    resourceService.reloadRoleResource(roleResourceBo);
    return Result.success("重载成功");
  }

  @ApiOperation("重载用户资源")
  @GetMapping("reloadUserRoleResource")
  @Auth(id = 4, name = "重载用户资源")
  public Result reloadUserRoleResource()
      throws Exception {
    RoleResourceBo roleResourceBo = new RoleResourceBo(2, resourceService.getResourceIds(
        "user"));
    resourceService.reloadRoleResource(roleResourceBo);
    return Result.success("重载成功");
  }

  @ApiOperation("更改接口开放状态")
  @GetMapping("modifyResourceStatus")
  @Auth(id = 5, name = "更改接口开放状态")
  public Result modifyResourceStatus(@NotNull(message = "resourceId不能为空") @RequestParam(
      "resourceId") int resourceId)
      throws Exception {
    if (resourceService.modifyResourceStatus(resourceId) == 1) {
      ApiFilter.updateResources(resourceId);
      return Result.success("更改成功");
    } else {
      return Result.failure(ResultCode.SWITCH_ERROR);
    }
  }

  @ApiOperation("获取资源接口")
  @PostMapping("getResourceByCond")
  @Auth(id = 6, name = "获取资源接口")
  public Result getResourceByCond(@RequestBody ResourceDTO resourceDTO)
      throws Exception {
    PageInfo<Resource> resourceList = resourceService.getResourceList(resourceDTO);
    if (resourceList.getSize() > 0) {
      return Result.success(resourceList);
    } else {   //必须得这么写，不然分页查询有bug
      resourceDTO.setIndex(1);
      resourceList = resourceService.getResourceList(resourceDTO);
      if (resourceList.getSize() > 0) {
        return Result.success(resourceList);
      } else {
        return Result.failure(ResultCode.DATA_GET_ERROR);
      }
    }
  }

  @ApiOperation("获取报名记录")
  @PostMapping("getSignUpList")
  @Auth(id = 10, name = "获取报名记录")
  public Result getSelectList(@RequestBody SignUpDTO signUpDTO) throws Exception {
    System.out.println(signUpDTO);
    PageInfo<SignUpVO> signUpList = signUpService.getSignUpListByCond(signUpDTO);

    if (signUpList.getSize() > 0) {
      return Result.success(signUpList);
    } else {   //必须得这么写，不然分页查询有bug
      signUpDTO.setIndex(1);
      signUpList = signUpService.getSignUpListByCond(signUpDTO);
      if (signUpList.getSize() > 0) {
        return Result.success(signUpList);
      } else {
        throw new ApiException(ResultCode.UNKNOWN_ERROR);
      }
    }
  }

  @ApiOperation("更新报名记录")
  @PostMapping("modifySignUpList")
  @Auth(id = 11, name = "更新报名记录")
  public Result modifySelectList(@RequestBody SignUp signUP) throws Exception {
    System.out.println(signUP);

    if (signUpService.modifySignUpList(signUP) == 1) {
      return Result.success("更新成功");
    } else {
      return Result.failure(ResultCode.SIGNUP_MODIFY_ERROR);
    }
  }

  @ApiOperation("增加标签")
  @GetMapping("addTag")
  @Auth(id = 12, name = "增加标签")
  public Result addTag(@NotBlank(message = "名称不能为空") @RequestParam("name") String name,
      @NotNull(message = "排序权重不能为空") @RequestParam("order") int order) throws Exception {

    if (tagService.getTagByName(name) == null) {
      if (tagService.saveTag(name, order) == 1) {
        return Result.success();
      } else {
        return Result.failure(ResultCode.DATA_SAVE_ERROR);
      }
    } else {
      return Result.failure(ResultCode.TAG_EXISTS);
    }
  }

  @ApiOperation("更新标签")
  @GetMapping("modifyTag")
  @Auth(id = 13, name = "更新标签")
  public Result modifyTag(
      @NotNull(message = "标签id不能为空") @RequestParam("tagId") int tagId,
      @NotBlank(message = "名称不能为空") @RequestParam("name") String name,
      @NotNull(message = "排序权重不能为空") @RequestParam("order") int order) throws Exception {
    Tag tag = new Tag(tagId, name, order);
    if (tagService.modifyTag(tag) == 1) {
      return Result.success();
    } else {
      return Result.failure(ResultCode.DATA_UPDATE_ERROR);
    }
  }

  @ApiOperation("删除标签")
  @PostMapping("removeTag")
  @Auth(id = 14, name = "删除标签")
  public Result removeTag(
      @RequestBody List<Integer> list
  ) throws Exception {
    if (tagService.removeByIdList(list) >= 1) {
      return Result.success();
    } else {
      return Result.failure(ResultCode.DATA_DEL_ERROR);
    }
  }

  @ApiOperation("获取标签列表")
  @PostMapping("getTagByCond")
  @Auth(id = 15, name = "获取标签列表")
  public Result getTagByCond(
      @RequestBody @Validated TagDTO tagDTO
  ) throws Exception {
    PageInfo<Tag> tagList = tagService.getTagListByCond(tagDTO);
    if (tagList != null) {
      return Result.success(tagList);
    } else {
      return Result.failure(ResultCode.DATA_GET_ERROR);
    }
  }

  @PostMapping("saveBook")
  @ApiOperation("添加书籍")
  @Auth(id = 16, name = "添加书籍")
  public Result saveBook(@RequestBody BookVO bookVO) {
    System.out.println(bookVO);

    if (bookService.saveBook(bookVO) == 1) {
      return Result.success();
    } else {
      return Result.failure(ResultCode.DATA_GET_ERROR);
    }
  }
}
