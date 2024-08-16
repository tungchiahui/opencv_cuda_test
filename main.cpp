#include <opencv2/opencv.hpp>
#include <opencv2/cudaarithm.hpp>
#include <opencv2/cudaimgproc.hpp>
#include <iostream>

int main(int argc, char** argv) {
    // 检查是否有 GPU 支持
    if (!cv::cuda::getCudaEnabledDeviceCount()) {
        std::cerr << "CUDA 不可用，请检查你的 GPU 和驱动。" << std::endl;
        return -1;
    }

    // 读取输入图像
    cv::Mat img = cv::imread("../素材/林星阑.jpg", cv::IMREAD_COLOR);
    if (img.empty()) {
        std::cerr << "无法读取图片，请检查路径和格式。" << std::endl;
        return -1;
    }

    // 将图像上传到 GPU
    cv::cuda::GpuMat d_img;
    d_img.upload(img);

    // 创建一个与原图像相同大小的全黑图像
    cv::cuda::GpuMat d_black(img.size(), d_img.type());
    d_black.setTo(cv::Scalar(0, 0, 0));  // 设置全黑

    // 使用 cv::cuda::add 函数进行图像加法
    cv::cuda::GpuMat d_result;
    cv::cuda::add(d_img, d_black, d_result);

    // 下载结果图像到 CPU
    cv::Mat result;
    d_result.download(result);

    // 显示图像
    cv::imshow("Original Image", img);
    cv::imshow("Result Image", result);
    cv::waitKey(0);

    return 0;
}
