# CMake
提供CMake各种场景

## build

## Test

## Install

## Package

## 其它

### Qt
介绍Qt相关的cmake配置

详情：离线文档查看`cmake-qt(7)`

#### 环境
附件Qt的cmake模块CMAKE_PREFIX_PATH到中

示例：`LIST(APPEND CMAKE_PREFIX_PATH "D:/Qt/Qt5.14.0/5.14.0/msvc2017_64") `

#### 针对生成文件的分组
将moc_*.cpp、ui_*.h等通过AUTOMOC、AUTORCC生成的文件分组，由于IDL方式是采用PRE_BUILD生成的，其源文件在configurate时期是无法捕获到对应的文件，所以需要cmake本身支持，否则会自动进行分组，对于二次开发的可读性是比较差的

示例：`set_property(GLOBAL PROPERTY AUTOGEN_SOURCE_GROUP "Generated files")`

详情：离线文档搜索`AUTOGEN_SOURCE_GROUP`、`Build Events`

#### Qt VS Tools
将普通的vcxproj转成Qt项目

示例：`set_target_properties(${PROJECT_NAME} PROPERTIES VS_GLOBAL_KEYWORD "QtVS_v304")`

详情：离线文档搜索`VS_GLOBAL_KEYWORD`

### source_group
Define a grouping for source files in IDE project generation. There are two different signatures to create source groups.

注：分组变化有时候可能不会即时响应，可重启visual studio

详情：离线文档搜索`source_group`

- source_group(<name> [FILES <src>...] [REGULAR_EXPRESSION <regex>])

示例：`source_group ("Header files" FILES ${prj_header})`

- source_group(TREE <root> [PREFIX <prefix>] [FILES <src>...])

基于源文件的相对路径（公共前缀字符串）

示例：`source_group(TREE ${prj_root}/.. FILES ${prj_src})`

### GoogleTest