package com.softlab.okr;

/**
 * 代码生成
 */
//public class CodeGenerator {
//
//
//  private static final String JDBC_MYSQL_URL = "jdbc:mysql://localhost:3306/okr?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
//  private static final String USERNAME = "root";
//  private static final String PASSWORD = "";
//
//  /**
//   * <p>
//   * 读取控制台内容
//   * </p>
//   */
//  public static String scanner(String tip) {
//    Scanner scanner = new Scanner(System.in);
//    StringBuilder help = new StringBuilder();
//    help.append("请输入" + tip + "：");
//    System.out.println(help.toString());
//    if (scanner.hasNext()) {
//      String ipt = scanner.next();
//      if (StringUtils.isNotBlank(ipt)) {
//        return ipt;
//      }
//    }
//    throw new MybatisPlusException("请输入正确的" + tip + "！");
//  }
//
//  public static void main(String[] args) {
//    // 代码生成器
//    AutoGenerator mpg = new AutoGenerator();
//
//    // 全局配置
//    GlobalConfig gc = new GlobalConfig();
//
////        就是项目的文件夹绝对路径
//    String projectPath = System.getProperty("user.dir");
//    gc.setOutputDir(projectPath + "/src/main/java/");
//    gc.setAuthor("Mybatis-plus自动生成");
//    gc.setOpen(false);
//    // gc.setSwagger2(true); 实体属性 Swagger2 注解
//    // 是否覆盖同名文件，默认是false
//    gc.setFileOverride(false);
//    // XML 二级缓存
//    gc.setEnableCache(false);
//    // XML ResultMap
//    gc.setBaseResultMap(true);
//    // XML columList
//    gc.setBaseColumnList(true);
//    gc.setDateType(DateType.ONLY_DATE);
//    mpg.setGlobalConfig(gc);
//
//    // 数据源配置
//    DataSourceConfig dsc = new DataSourceConfig();
//    dsc.setUrl(JDBC_MYSQL_URL);
//    // dsc.setSchemaName("public");
//    dsc.setDriverName("com.mysql.jdbc.Driver");
//    dsc.setUsername(USERNAME);
//    dsc.setPassword(PASSWORD);
//    mpg.setDataSource(dsc);
//
//    // 包配置
//    PackageConfig pc = new PackageConfig();
//    //所属模块
////        pc.setModuleName("qax-manager-platform");
//    //自动以包路径
//    pc.setParent("com.softlab.okr.dao");
//    mpg.setPackageInfo(pc);
//
//    // 自定义配置
//    InjectionConfig cfg = new InjectionConfig() {
//      @Override
//      public void initMap() {
//
//        // to do nothing
//      }
//    };
//
//    //如果模板引擎是 freemarker
//    String templatePath = "/templates/mapper.xml.ftl";
//    // 如果模板引擎是 velocity
//    // String templatePath = "/templates/mapper.xml.vm";
//
//    // 自定义输出配置
//    List<FileOutConfig> focList = new ArrayList<>();
//    // 自定义配置会被优先输出
//    focList.add(new FileOutConfig(templatePath) {
//      @Override
//      public String outputFile(TableInfo tableInfo) {
//        // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
//        return projectPath + "/src/main/resources/mapper/" + tableInfo
//            .getEntityName() + "Mapper" + StringPool.DOT_XML;
//      }
//    });
//    cfg.setFileOutConfigList(focList);
//    mpg.setCfg(cfg);
//
//    // 配置模板
//    TemplateConfig templateConfig = new TemplateConfig();
//
//    templateConfig.setXml(null);
////        templateConfig.setController("");//不生成controller
//    mpg.setTemplate(templateConfig);
//
//    // 策略配置
//    StrategyConfig strategy = new StrategyConfig();
//    strategy.setNaming(NamingStrategy.underline_to_camel);
//    strategy.setColumnNaming(NamingStrategy.underline_to_camel);
//    strategy.setSuperEntityClass(BaseEntity.class);
//    strategy.setEntityLombokModel(true);
//    strategy.setRestControllerStyle(true);
//    // 公共父类
////        strategy.setSuperControllerClass("你自己的父类控制器,没有就不用设置!");
//    // 写于父类中的公共字段
////        strategy.setSuperEntityColumns("id");
//    strategy.setInclude(
//        scanner("表名，多个英文逗号分割；tip:生成的service和controller需要自己手动copy到相应的model下。").split(","));
//    strategy.setControllerMappingHyphenStyle(true);
////        strategy.setTablePrefix("xxx_");
////        strategy.setTablePrefix(pc.getModuleName() + "_");
//    mpg.setStrategy(strategy);
//    mpg.setTemplateEngine(new FreemarkerTemplateEngine());
//    mpg.execute();
//  }
//
//}