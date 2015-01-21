#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/objdetect/objdetect.hpp"
#include "opencv2/highgui/highgui.hpp"

#include <stdio.h>
#include <string.h>
#include <ctype.h>

using namespace std;
using namespace cv;

int main(int argc, char** argv){

  Mat img = imread("O.png",1);
  Size s = img.size();

  printf("here hieght:%d width:%d\n",s.height,s.width);
  cv::threshold(img, img, 127, 255,THRESH_BINARY); 
  printf("here\n");
  cv::Mat skel(img.size(), CV_8UC1, cv::Scalar(0));
  printf("here\n");
  cv::Mat temp;
  printf("here\n");
  cv::Mat eroded;
 printf("here\n");
  cv::Mat element = cv::getStructuringElement(cv::MORPH_CROSS, cv::Size(3, 3));
 printf("here\n");
  bool done;
  int i = 0;    
  do{
    printf("%d\n",i++);
    cv::erode(img, eroded, element);
    cv::dilate(eroded, temp, element); // temp = open(img)
    cv::subtract(img, temp, temp);
    cv::bitwise_or(skel, temp, skel);
    eroded.copyTo(img);
 
    done = (cv::countNonZero(img) == 0);
  } while (!done);
  cv::imshow("Skeleton", skel);
  cv::waitKey(0);
  return 0;
}