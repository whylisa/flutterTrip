# trip

## statelessWidget 无状态组件
   - container 容器
   - Text
   - Icon
   - CloseButton
   - BackButton
   - Chip 
   - Divider 分割线
   - Crad
   - AlerDialog
## StatefulWidget 有状态的组件
   - MaterialApp 放在根节点，材料
   - Scaffold 脚手架
   - AppBar  顶部的导航栏
   - BottomNavigationBar 底部的导航栏
   - RefreshIndicator 刷新指示器
   - Image 图片组件
   - TextFiled 输入框组件
   - PageView 
## Flutter 布局开发
   - Container
   - RenderObjectWidget
     - SingleChildRenderObjectWidget 单节点布局
       - Opacity 透明度
       - ClipOval 裁剪成圆形
       - ClipRRect 方形
       - PhysicalModel 显示不同形状的
       - Align Center 居中
       - Padding 内边距
       - SizeBox 大小
       - FractionallySizeBox 约束里面的布局水平方向，垂直方向的伸展
     - MultiChildRenderObjectWidget 多节点布局
       - Stack 布局都是一个叠一个
       - Flex 
         - Column y 垂直方向
         - Row x 水平方向
       - Wrap 换行
       - Flow
   - ParentDataWidget
     - Positioned 固定view的位置，和stack 搭配
     - Flexble
       - Expanded 展开
## 手势
   - onTap
   - onDoubleTap
   - onTapCancel
   - onTapUp
   - onTapDown
   - onLongPress
## 导入外部资源
   - 
## 打开第三方app
   - url_launcher
## 字体图标
  - ttf字体文件 
  - 在yaml 启动字体
  - 局部应用，TextSytle(ff)
## 拍照
  - image_picker 插件
## 移除padding
  - MediaQuery.removePadding(context: context, child: ;;;)
  - 监听列表的滚动： NotificationListener(child: ;onNotifation: (scrollNotification){}