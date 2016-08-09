# ZCJWeather
一个MVVM demo，去除了绑定机制，简化使用方式

# 前言

MVC（Model-View-Controller）是最经典的架构模式，其中Model是作为数据管理者，View作为数据展示者，Controller作为数据加工者，Model和View又都是由Controller来根据业务需求调配，所以Controller还负担了一个数据流调配的功能。

MVCS是基于MVC衍生出来的一套架构。从概念上来说，它拆分的部分是Model部分，拆出来一个Store。这个Store专门负责数据存取。

MVVM本质上也是从MVC中派生出来的思想，它把数据加工的任务从Controller中解放了出来，使得Controller只需要专注于数据调配的工作，ViewModel则去负责数据加工并通过通知机制让View响应ViewModel的改变。大部分MVVM架构都会使用ReactiveCocoa，ReactiveCocoa带来了信号通知效果。
当然MVVM也有缺点，数据绑定让调试更难了，界面上出现的bug，可能是view的代码有问题，也可能是model有问题。数据绑定让一个位置的bug快速传递到其它位置上，定位原始出问题的地方不那么容易。而且数据绑定需要花费更大的内存。MVVM的学习和开发成本也很高，大家对它不熟悉，基于绑定机制进行编程需要一定时间的学习才能上手。

MVVM扩展版是在MVC和MVVM两种架构中权衡而产生的架构。它引用了ViewModel，将表示逻辑移到ViewModel中。一个view对应一个ViewModel，其包含了这个View数据展示和样式定制所需要的所有数据。同时，不再引用双向数据绑定机制，而使用传统的代理回调将ui事件传递给外界。这个架构中，
ViewModel负责处理数据展示和样式定制的逻辑； ViewController仅仅充当简单胶水的作用。

# MVVM

### Model
在MVVM模式中，Model的职责是什么？它应该只是用于表达数据，数据存储、数据处理交给其他部分来做。它不该承担太多的职责，做个瘦model。
  
<img src="https://github.com/superzcj/ZCJWeather/blob/master/%E5%9B%BE%E7%89%87%202.png" alt="Kingfisher" title="Kingfisher" width="557"/>

如图所示，Weather model仅仅定义了几个属性来表达数据，没有任何数据加工的部分。
在MVVM中，Model只负责表达数据，处理数据存储和数据加工移交到ViewModel中。


####ViewModel
ViewModel负责处理数据展示加工和定制样式的逻辑，同时不引入双向绑定机制，而是通过传统的代理回调将UI事件传递给外界。每一个View对应一个ViewModel，这个VIewModel会包含展示这个View所需要的所有数据。

<img src="https://github.com/superzcj/ZCJWeather/blob/master/%E5%9B%BE%E7%89%87%203.png" alt="Kingfisher" title="Kingfisher" width="557"/>

如图所示，WeatherViewModel有自己的属性，提供给对应的View。它传入weather model，加工数据以满足view需要。

####View
View只需要定义好装配ViewModel的接口和定义好UI回调事件即可

<img src="https://github.com/superzcj/ZCJWeather/blob/master/%E5%9B%BE%E7%89%87%204.png" alt="Kingfisher" title="Kingfisher" width="557"/>

####ViewController
ViewController管理View Controller的生命周期，负责生成所有的View实例，并放入到View Controller中。监听处理来自View和业务相关的事件。

<img src="https://github.com/superzcj/ZCJWeather/blob/master/%E5%9B%BE%E7%89%87%205.png" alt="Kingfisher" title="Kingfisher" width="557"/>

