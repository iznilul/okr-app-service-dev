package com.softlab.okr.controller;

/**
 * 角色
 *
 * @author RudeCrab
 */
//@Validated
//@RestController
//@RequestMapping("/api/admin")
//@Api(tags = "管理员操作")
//@Auth(id = 2000, name = "管理员操作")
//public class AdminController {
//
//  @Autowired
//  private UserEntityService userEntityService;
//
//  @Autowired
//  private ResourceService resourceService;
//
//  @Autowired
//  private ISignUpService signUpService;
//
//  @Autowired
//  private ITagService tagService;
//
//  @Autowired
//  private IBookService bookService;
//
//  @Autowired
//  private IKeyService keyService;
//
//  @Autowired
//  private IKeyUserService keyUserService;
//
//  @Autowired
//  private ILoginLogService loginLogService;
//
//  @ApiOperation("注册用户")
//  @PostMapping("register")
//  @Auth(id = 1, name = "注册用户")
//  public Result register(@Validated @RequestBody RegisterDTO dto) {
//
//    if (userEntityService.getByUsername(dto.getUsername()) == null) {
//      userEntityService.register(dto);
//      return Result.success();
//    } else {
//      return Result.failure();
//    }
//  }
//
//  @ApiOperation("删除用户")
//  @GetMapping("removeByUsername")
//  @Auth(id = 2, name = "删除用户")
//  public Result removeByUsername(
//      @NotBlank(message = "username不能为空") @RequestParam("username") String username) {
//
//    if (userEntityService.getByUsername(username) != null) {
//      userEntityService.removeByUsername(username);
//      return Result.success();
//    } else {
//      return Result.failure();
//    }
//  }
//
//  @ApiOperation("重载管理员资源")
//  @GetMapping("reloadAdminRoleResource")
//  @Auth(id = 3, name = "重载管理员资源")
//  public Result reloadAdminRoleResource() {
//    RoleResourceBo bo = new RoleResourceBo(1, resourceService.getResourceIds("admin"));
//    resourceService.reloadRoleResource(bo);
//    return Result.success();
//  }
//
//  @ApiOperation("重载用户资源")
//  @GetMapping("reloadUserRoleResource")
//  @Auth(id = 4, name = "重载用户资源")
//  public Result reloadUserRoleResource() {
//    RoleResourceBo bo = new RoleResourceBo(2, resourceService.getResourceIds("user"));
//    resourceService.reloadRoleResource(bo);
//    return Result.success();
//  }
//
//  @ApiOperation("更改接口开放状态")
//  @GetMapping("modifyResourceStatus")
//  @Auth(id = 5, name = "更改接口开放状态")
//  public Result modifyResourceStatus(
//      @NotNull(message = "resourceId不能为空") @RequestParam("resourceId") int resourceId) {
//    if (resourceService.modifyResourceStatus(resourceId) == 1) {
//      return Result.success();
//    } else {
//      return Result.failure();
//    }
//  }
//
//  @ApiOperation("获取资源接口")
//  @PostMapping("getResourceByCond")
//  @Auth(id = 6, name = "获取资源接口")
//  public Result getResourceByCond(@RequestBody ResourceDTO dto) {
//    PageInfo<ResourceVO> pageInfo = resourceService.getResourceList(dto);
//    if (pageInfo.getSize() > 0) {
//      return Result.success(pageInfo);
//    } else { // 必须得这么写，不然分页查询有bug
//      dto.setIndex(1);
//      pageInfo = resourceService.getResourceList(dto);
//      if (pageInfo.getSize() > 0) {
//        return Result.success(pageInfo);
//      } else {
//        return Result.failure();
//      }
//    }
//  }
//
//  @ApiOperation("获取报名记录")
//  @PostMapping("getSignUp")
//  @Auth(id = 9, name = "获取报名记录")
//  public Result getSignUp(@RequestBody SignUpDTO dto) {
//    System.out.println(dto);
//    PageInfo<SignUpVO> pageInfo = signUpService.getSignUpByCond(dto);
//
//    if (pageInfo.getSize() > 0) {
//      return Result.success(pageInfo);
//    } else { // 必须得这么写，不然分页查询有bug
//      dto.setIndex(1);
//      pageInfo = signUpService.getSignUpByCond(dto);
//      if (pageInfo.getSize() > 0) {
//        return Result.success(pageInfo);
//      } else {
//        return Result.failure();
//      }
//    }
//  }
//
//  @ApiOperation("更新报名记录")
//  @PostMapping("modifySignUp")
//  @Auth(id = 10, name = "更新报名记录")
//  public Result modifyModifyList(@RequestBody SignUp signUP) {
//    System.out.println(signUP);
//
//    if (signUpService.modifySignUp(signUP) == 1) {
//      return Result.success();
//    } else {
//      return Result.failure();
//    }
//  }
//
//  @ApiOperation("导出报名单")
//  @GetMapping("exportSignUp")
//  @Auth(id = 11, name = "导出报名单")
//  public void exportSignUp(HttpServletResponse response) throws IOException {
//    signUpService.exportSignUp(response);
//  }
//
//  @ApiOperation("增加标签")
//  @GetMapping("addTag")
//  @Auth(id = 12, name = "增加标签")
//  public Result addTag(
//      @NotBlank(message = "名称不能为空") @RequestParam("name") String name,
//      @NotNull(message = "排序权重不能为空") @RequestParam("order") int order) {
//    return tagService.saveTag(name, order);
//  }
//
//  @ApiOperation("更新标签")
//  @GetMapping("modifyTag")
//  @Auth(id = 13, name = "更新标签")
//  public Result modifyTag(
//      @NotNull(message = "标签id不能为空") @RequestParam("tagId") int tagId,
//      @NotBlank(message = "名称不能为空") @RequestParam("name") String name,
//      @NotNull(message = "排序权重不能为空") @RequestParam("order") int order) {
//    return tagService.modifyTag(tagId, name, order);
//  }
//
//  @ApiOperation("删除标签")
//  @GetMapping("removeTag")
//  @Auth(id = 14, name = "删除标签")
//  public Result removeTag(@RequestParam("tagId") @NotNull int tagId) {
//    return tagService.removeById(tagId);
//  }
//
//  @ApiOperation("获取标签列表")
//  @PostMapping("getTagByCond")
//  @Auth(id = 15, name = "获取标签列表")
//  public Result getTagByCond(@RequestBody @Validated TagDTO dto) {
//    return tagService.getTagListByCond(dto);
//  }
//
//  @PostMapping("saveBook")
//  @ApiOperation("添加书籍")
//  @Auth(id = 16, name = "添加书籍")
//  public Result saveBook(@RequestBody BookVO vo) {
//    System.out.println(vo);
//
//    return bookService.saveBook(vo);
//  }
//
//  @GetMapping("uploadBookImg")
//  @ApiOperation("上传书籍照片")
//  @Auth(id = 17, name = "上传书籍照片")
//  public Result modifyBookImg(
//      @RequestParam("bookId") int bookId, @RequestParam("file") MultipartFile file)
//      throws Exception {
//
//    return bookService.uploadBookImg(bookId, file);
//  }
//
//  @PostMapping("modifyBook")
//  @ApiOperation("修改书籍")
//  @Auth(id = 18, name = "修改书籍")
//  public Result modifyBook(@RequestBody @Validated BookVO vo) {
//    System.out.println(vo);
//
//    return bookService.modifyBook(vo);
//  }
//
//  @GetMapping("removeBook")
//  @ApiOperation("删除书籍")
//  @Auth(id = 19, name = "删除书籍")
//  public Result removeBook(@RequestParam("bookId") @NotNull int bookId) {
//
//    return bookService.removeBook(bookId);
//  }
//
//  @GetMapping("saveKey")
//  @ApiOperation("增加钥匙")
//  @Auth(id = 20, name = "增加钥匙")
//  public Result saveKey(@RequestParam("keyName") @NotBlank String keyName) {
//    return keyService.saveKey(keyName);
//  }
//
//  @GetMapping("modifyKey")
//  @ApiOperation("修改钥匙")
//  @Auth(id = 21, name = "修改钥匙")
//  public Result saveKey(@RequestParam("keyId") @NotNull int keyId,
//      @RequestParam("keyName") @NotBlank String keyName) {
//    return keyService.modifyKey(keyId, keyName);
//  }
//
//  @GetMapping("removeKey")
//  @ApiOperation("删除钥匙")
//  @Auth(id = 22, name = "删除钥匙")
//  public Result removeKey(@RequestParam("keyId") @NotNull int keyId) {
//    return keyService.removeById(keyId);
//  }
//
//  @GetMapping("saveKeyUser")
//  @ApiOperation("增加钥匙持有人")
//  @Auth(id = 23, name = "增加钥匙持有人")
//  public Result saveKeyUser(@RequestParam("keyId") @NotNull int keyId,
//      @RequestParam("userId") @NotNull int userId) {
//    return keyUserService.saveKeyUser(keyId, userId);
//  }
//
//  @GetMapping("removeKeyUser")
//  @ApiOperation("删除钥匙持有人")
//  @Auth(id = 24, name = "删除钥匙持有人")
//  public Result saveKey(@RequestParam("keyId") @NotNull int keyId,
//      @RequestParam("userId") @NotNull int userId) {
//    return keyUserService.removeByUserId(keyId, userId);
//  }
//
//  @LimitedAccess(frequency = 2, second = 30)
//  @PostMapping("getLoginLogByCond")
//  @ApiOperation("登录日志列表")
//  @Auth(id = 25, name = "登录日志列表")
//  public Result getLoginLogList(@RequestBody @Validated LoginLogDTO dto) {
//    //System.out.println(dto);
//
//    return loginLogService.getByCond(dto);
//  }
//}
