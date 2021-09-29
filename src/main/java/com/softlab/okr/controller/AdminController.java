package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.annotation.LimitedAccess;
import com.softlab.okr.entity.Key;
import com.softlab.okr.entity.SignUp;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.dto.LoginLogDTO;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.dto.RegisterDTO;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.dto.TagDTO;
import com.softlab.okr.service.IBookService;
import com.softlab.okr.service.IKeyService;
import com.softlab.okr.service.IKeyUserService;
import com.softlab.okr.service.ILoginLogService;
import com.softlab.okr.service.IResourceService;
import com.softlab.okr.service.IRoleResourceService;
import com.softlab.okr.service.ISignUpService;
import com.softlab.okr.service.ITagService;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
  private IUserEntityService userEntityService;

  @Autowired
  private IResourceService resourceService;

  @Autowired
  private ISignUpService signUpService;

  @Autowired
  private ITagService tagService;

  @Autowired
  private IBookService bookService;

  @Autowired
  private IKeyService keyService;

  @Autowired
  private IKeyUserService keyUserService;

  @Autowired
  private ILoginLogService loginLogService;

  @Autowired
  private IRoleResourceService roleResourceService;

  @ApiOperation("注册用户")
  @PostMapping("register")
  @Auth(id = 1, name = "注册用户")
  public Result register(@Validated @RequestBody RegisterDTO dto) {

    return userEntityService.register(dto) ? Result.success() : Result.failure();
  }

  @ApiOperation("删除用户")
  @GetMapping("removeByUsername")
  @Auth(id = 2, name = "删除用户")
  public Result removeByUsername(
      @NotBlank(message = "username不能为空") @RequestParam("username") String username) {

    return userEntityService.removeByUsername(username) == 1 ?
        Result.success() : Result.failure();
  }

  @ApiOperation("重载角色资源")
  @GetMapping("reloadRoleResource")
  @Auth(id = 3, name = "重载角色资源")
  public Result reloadAdminRoleResource() {
    return roleResourceService.reloadRoleResource() ?
        Result.success() : Result.failure();
  }

  @ApiOperation("更改接口开放状态")
  @GetMapping("modifyResourceStatus")
  @Auth(id = 5, name = "更改接口开放状态")
  public Result modifyResourceStatus(
      @NotNull(message = "resourceId不能为空") @RequestParam("resourceId") int resourceId) {
    return resourceService.modifyResourceStatus(resourceId) == 1 ?
        Result.success() : Result.failure();
  }

  @ApiOperation("获取资源接口")
  @PostMapping("getResourceByCond")
  @Auth(id = 6, name = "获取资源接口")
  public Result getResourceByCond(@RequestBody PageDTO dto) {
    return resourceService.getResourceList(dto);
  }

  @ApiOperation("获取报名记录")
  @PostMapping("getSignUp")
  @Auth(id = 9, name = "获取报名记录")
  public Result getSignUp(@RequestBody SignUpDTO dto) {
    return signUpService.getSignUpByCond(dto);
  }

  @ApiOperation("更新报名记录")
  @PostMapping("modifySignUp")
  @Auth(id = 10, name = "更新报名记录")
  public Result modifyModifyList(@RequestBody SignUp signUP) {

    return signUpService.modifySignUp(signUP) == 1 ?
        Result.success() : Result.failure();
  }

  @ApiOperation("导出报名单")
  @GetMapping("exportSignUp")
  @Auth(id = 11, name = "导出报名单")
  public void exportSignUp(HttpServletResponse response) throws IOException {
    signUpService.exportSignUp(response);
  }

  @ApiOperation("增加标签")
  @GetMapping("addTag")
  @Auth(id = 12, name = "增加标签")
  public Result addTag(
      @NotBlank(message = "名称不能为空") @RequestParam("name") String name,
      @NotNull(message = "排序权重不能为空") @RequestParam("order") int order) {
    return tagService.saveTag(name, order) == 1 ?
        Result.success() : Result.failure();
  }

  @ApiOperation("更新标签")
  @GetMapping("modifyTag")
  @Auth(id = 13, name = "更新标签")
  public Result modifyTag(
      @NotNull(message = "标签id不能为空") @RequestParam("tagId") int tagId,
      @NotBlank(message = "名称不能为空") @RequestParam("name") String name,
      @NotNull(message = "排序权重不能为空") @RequestParam("order") int order) {
    return tagService.modifyTag(tagId, name, order) == 1 ?
        Result.success() : Result.failure();
  }

  @ApiOperation("删除标签")
  @GetMapping("removeTag")
  @Auth(id = 14, name = "删除标签")
  public Result removeTag(@RequestParam("tagId") @NotNull int tagId) {
    return tagService.removeById(tagId) == 1 ?
        Result.success() : Result.failure();
  }

  @ApiOperation("获取标签列表")
  @PostMapping("getTagByCond")
  @Auth(id = 15, name = "获取标签列表")
  public Result getTagByCond(@RequestBody @Validated TagDTO dto) {
    return tagService.getTagListByCond(dto);
  }

  @PostMapping("saveBook")
  @ApiOperation("添加书籍")
  @Auth(id = 16, name = "添加书籍")
  public Result saveBook(@RequestBody BookDTO dto) {

    return bookService.saveBook(dto) ?
        Result.success() : Result.failure();
  }

  @GetMapping("uploadBookImg")
  @ApiOperation("上传书籍照片")
  @Auth(id = 17, name = "上传书籍照片")
  public Result modifyBookImg(
      @RequestParam("bookId") int bookId, @RequestParam("file") MultipartFile file)
      throws Exception {

    return bookService.uploadBookImg(bookId, file) == 1 ?
        Result.success() : Result.failure();
  }

  @PostMapping("modifyBook")
  @ApiOperation("修改书籍")
  @Auth(id = 18, name = "修改书籍")
  public Result modifyBook(@RequestBody BookDTO dto) {

    return bookService.modifyBook(dto) ?
        Result.success() : Result.failure();
  }

  @GetMapping("removeBook")
  @ApiOperation("删除书籍")
  @Auth(id = 19, name = "删除书籍")
  public Result removeBook(@RequestParam("bookId") @NotNull int bookId) {

    return bookService.removeBook(bookId) ?
        Result.success() : Result.failure();
  }

  @GetMapping("saveKey")
  @ApiOperation("增加钥匙")
  @Auth(id = 20, name = "增加钥匙")
  public Result saveKey(@RequestParam("keyName") @NotBlank String keyName) {
    return keyService.saveKey(keyName) == 1 ?
        Result.success() : Result.failure();
  }

  @GetMapping("modifyKey")
  @ApiOperation("修改钥匙")
  @Auth(id = 21, name = "修改钥匙")
  public Result saveKey(@RequestBody Key key) {
    return keyService.modifyKey(key) == 1 ?
        Result.success() : Result.failure();
  }

  @GetMapping("removeKey")
  @ApiOperation("删除钥匙")
  @Auth(id = 22, name = "删除钥匙")
  public Result removeKey(@RequestParam("keyId") @NotNull int keyId) {
    return keyService.removeById(keyId) == 1 ?
        Result.success() : Result.failure();
  }

  @GetMapping("saveKeyUser")
  @ApiOperation("增加钥匙持有人")
  @Auth(id = 23, name = "增加钥匙持有人")
  public Result saveKeyUser(@RequestParam("keyId") @NotNull int keyId,
      @RequestParam("userId") @NotNull int userId) {
    return keyUserService.saveKeyUser(keyId, userId) == 1 ?
        Result.success() : Result.failure();
  }

  @GetMapping("removeKeyUser")
  @ApiOperation("删除钥匙持有人")
  @Auth(id = 24, name = "删除钥匙持有人")
  public Result saveKey(@RequestParam("keyId") @NotNull int keyId,
      @RequestParam("userId") @NotNull int userId) {
    return keyUserService.removeByUserId(keyId, userId) == 1 ?
        Result.success() : Result.failure();
  }

  @LimitedAccess(frequency = 2, second = 30)
  @PostMapping("getLoginLogByCond")
  @ApiOperation("登录日志列表")
  @Auth(id = 25, name = "登录日志列表")
  public Result getLoginLogList(@RequestBody @Validated LoginLogDTO dto) {

    return loginLogService.getByCond(dto);
  }
}
