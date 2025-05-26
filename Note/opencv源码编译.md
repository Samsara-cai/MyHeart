# OpenCV编译

## 一、下载文件

核心模块代码：https://github.com/opencv/opencv.git

contribute贡献代码： https://github.com/opencv/opencv_contrib.git

cmake: https://cmake.org/download/

编译工具 visual studio  :https://visualstudio.microsoft.com/zh-hans/

编译器：msvc 安装vs的c++编程组件时已经安装过了。

## 二、编译步骤



1. Cmake GUI 工具，打开源码目录

   ![](G:\MyHeart\Note\resources\opencv源码目录选择.png)

   打开目录后设置build创建工程的目标目录 （where to build the binaries）

2. 选择编译工具

   ![](G:\MyHeart\Note\resources\cmake编译器选择.png)

3. 点击Configure后，出现许多编译选项。

   ![](G:\MyHeart\Note\resources\部分选项配置.png)

   OPENCV_EXTRA_MODULES_PATH 指定 contrib模块路径

   想要快一点，TEST相关的选项可以不勾选

4. Genarate 生成VS 工程

5. VS打开工程编译即可

三、Opencv 模块简介

#### 一、核心模块

- **core**：核心功能模块，包含基本数据结构（如 `cv::Mat`）、线性代数运算、文件 I/O 等。
- **imgproc**：图像处理模块，提供滤波、几何变换、色彩空间转换、直方图计算等功能。
- **imgcodecs**：图像编解码模块，支持 JPEG、PNG、TIFF 等多种格式的读取与写入。
- **videoio**：视频 I/O 模块，支持摄像头、视频文件的捕获与保存。
- **highgui**：高层 GUI 模块，提供窗口管理、鼠标事件处理与图像显示功能。
- **video**：视频分析模块，包含光流法、背景减除、运动跟踪等算法。
- **calib3d**：相机标定与 3D 重建模块，支持立体视觉、位姿估计、棋盘格标定等。
- **features2d**：特征检测与描述模块，提供 SIFT、SURF、ORB 等特征提取与匹配算法。
- **objdetect**：目标检测模块，支持 Haar 级联检测、HOG+SVM、QR 码检测等。
- **dnn**：深度学习模块，支持 ONNX、TensorFlow、PyTorch 等模型的加载与推理。
- **ml**：机器学习模块，提供 SVM、KNN、决策树等经典机器学习算法的实现。
- **flann**：快速近似最近邻搜索模块，用于高效的特征匹配与聚类。
- **photo**：计算摄影模块，包含图像修复、去噪、HDR 合成等高级图像处理技术。
- **stitching**：图像拼接模块，支持全景图生成与多图像对齐。
- **gapi**：图像处理流水线模块，提供高效的计算图优化与异构计算支持。

### 二、 contrib 模块

- **alphamat**：Alpha Matting 模块，支持图像前景提取与透明背景生成。
- **aruco**：ArUco 标记检测模块，支持 AR 应用中的标记检测与位姿估计。
- **barcode**：条形码检测与解码模块，用于检测和解析条形码信息。
- **bgsegm**：增强背景 - 前景分割模块，提供多种背景建模和前景检测算法。
- **bioinspired**：仿生学视觉模块，包含视网膜模型、动态视觉处理等算法。
- **ccalib**：自定义相机标定模块，提供更多的相机标定模式和方法。
- **cudaarithm**：CUDA 加速的算术运算模块，支持矩阵运算与逐元素操作。
- **cudabgsegm**：CUDA 加速的背景分割模块，提供高效的背景减除算法。
- **cudacodec**：CUDA 加速的视频编解码模块，支持 GPU 硬件加速的视频处理。
- **cudafeatures2d**：CUDA 加速的特征检测与描述模块，提供 GPU 版本的 SIFT、ORB 等算法。
- **cudafilters**：CUDA 加速的滤波模块，支持高斯滤波、边缘检测等操作。
- **cudaimgproc**：CUDA 加速的图像处理模块，提供色彩空间转换、直方图计算等功能。
- **cudalegacy**：CUDA 传统模块，包含早期 CUDA 实现的算法。
- **cudaobjdetect**：CUDA 加速的目标检测模块，支持 Haar 级联检测与 HOG+SVM。
- **cudaoptflow**：CUDA 加速的光流法模块，提供高效的稠密与稀疏光流计算。
- **cudastereo**：CUDA 加速的立体视觉模块，支持亚像素级视差计算与 3D 重建。
- **cudawarping**：CUDA 加速的图像几何变换模块，支持透视变换与图像扭曲。
- **cudev**：CUDA 设备管理模块，提供 GPU 设备信息查询与资源管理功能。
- **datasets**：数据集处理模块，用于处理不同数据集的框架。
- **dnn_objdetect**：基于 DNN 的目标检测模块，利用深度学习模型进行目标检测。
- **dnn_superres**：基于 DNN 的超分辨率模块，通过深度学习实现图像的超分辨率重建。
- **dpm**：可变形部件模型模块，用于目标检测和识别。
- **face**：人脸分析模块，提供人脸检测、人脸识别、表情分析等功能。
- **freetype**：使用 FreeType/harfbuzz 绘制 UTF-8 字符串的模块，支持在图像上绘制各种文字。
- **fuzzy**：基于模糊数学的图像处理模块，提供模糊图像处理算法。
- **hdf**：分层数据格式 I/O 模块，用于读写 HDF5 格式的数据文件。
- **hfs**：基于层次特征选择的图像分割模块，利用层次特征选择方法进行图像分割。
- **img_hash**：图像哈希模块，提供不同的图像哈希算法的实现。
- **intensity_transform**：强度变换模块，提供用于调整图像对比度的强度变换算法的实现。
- **julia**：OpenCV Julia 绑定模块，提供 OpenCV 与 Julia 语言的接口。
- **line_descriptor**：线条描述符模块，用于从图像中提取线条的二进制描述符。
- **mcc**：Macbeth 图表模块，用于处理 Macbeth 图表相关的图像分析任务。
- **optflow**：光流算法模块，提供多种光流计算方法。
- **ovis**：OGRE 三维可视化器模块，利用 OGRE 3D 引擎进行三维可视化。
- **phase_unwrapping**：相位展开模块，提供相位展开算法的实现。
- **plot**：Mat 数据绘制模块，提供绘制 Mat 数据的函数。
- **quality**：图像质量分析模块，用于评估图像的质量。
- **rapid**：快速 3D 目标跟踪模块，适用于实时 AR 应用。
- **reg**：图像配准模块，提供图像配准算法。
- **rgbd**：RGB 深度处理模块，支持深度图像融合与 3D 场景重建。
- **saliency**：显著性分析模块，用于检测图像或视频中的显著区域。
- **sfm**：运动结构分析模块，根据图像序列计算三维结构和相机运动。
- **shape**：形状分析模块，支持形状匹配与距离变换。
- **structured_light**：结构光模块，提供结构光模式下的图像处理功能。
- **superres**：超分辨率模块，提供基于光流法与深度学习的图像超分辨率重建。
- **surface_matching**：曲面匹配模块，用于三维曲面的匹配。
- **text**：场景文字检测与识别模块，支持文本行检测、字符识别等功能。
- **tracking**：目标跟踪模块，提供了多种目标跟踪算法。
- **videostab**：视频稳定模块，用于视频的稳定处理。
- **viz**：三维可视化模块，支持点云、网格与三维模型的交互式显示。
- **wechat_qrcode**：微信二维码检测器模块，用于检测和解析二维码。
- **xfeatures2d**：features2d 扩展模块，包含 SURF、DAISY 等额外特征提取算法。
- **ximgproc**：imgproc 扩展模块，提供边缘感知滤波、结构森林边缘检测等高级算法。
- **xobjdetect**：objdetect 扩展模块，提供更多的目标检测方法。
- **xphoto**：photo 扩展模块，包含白平衡调整、图像修复等增强功能。

### 三、GUI 相关模块

- **highgui**：高层 GUI 模块，提供窗口管理、鼠标事件处理与图像显示功能。
- **viz**：三维可视化模块，支持点云、网格与三维模型的交互式显示，可通过 OpenGL 等图形库实现可视化效果。
- **plot**：Mat 数据绘制模块，提供绘制 Mat 数据的函数，可生成曲线图、散点图等可视化图表。

### 各模块编译所需的第三方库

- **core**：无需额外第三方库。
- **imgproc**：无需额外第三方库。
- **imgcodecs**：需要 libjpeg、libpng、libtiff、libjasper、libopenjp2 等图像编解码库。
- **videoio**：需要 libavcodec、libavformat、libavutil、libswscale 等 FFmpeg 相关库，或者 gstreamer 等视频处理库。
- **highgui**：需要 GTK+ 或 Qt 等图形界面库。
- **video**：无需额外第三方库。
- **calib3d**：无需额外第三方库。
- **features2d**：无需额外第三方库。
- **objdetect**：无需额外第三方库。
- **dnn**：需要 protobuf 等库，用于解析深度学习模型文件。
- **ml**：无需额外第三方库。
- **flann**：无需额外第三方库。
- **photo**：无需额外第三方库。
- **stitching**：无需额外第三方库。
- **gapi**：无需额外第三方库。
- **cudaarithm** 等 CUDA 相关模块：需要 NVIDIA CUDA Toolkit，包括 CUDA 运行时库、CUDA 工具箱等。
- **dnn_objdetect** 等深度学习相关模块：可能需要依赖深度学习框架的库，如 TensorFlow、PyTorch 等的库文件。
- **face**：无需额外第三方库。
- **rgbd**：无需额外第三方库。
- **superres**：无需额外第三方库。
- **viz**：需要 OpenGL、GLUT 等图形库。
- **surf**：无需额外第三方库。
- **other contrib modules**：根据模块的具体功能，可能需要相应的第三方库，例如 aruco 模块无需额外第三方库，而 ovis 模块需要 OGRE 3D 引擎库等。