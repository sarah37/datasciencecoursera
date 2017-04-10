# Code Book

This is an updated version of the file "features_info.txt", which is included with the original data set. For the purposes of this summary dataset, the variable names were made more verbose (e.g. "Acceleration" instead of "Acc", "Time" instead of "t"). The description was updated accordingly.
All data is available in a single file (UCI_HAR_Dataset_averaged.csv). Each row contains the averages for the different variables for a unique test subject (subjectid) and activity they were performing (activity, can be walking, walking_upstairs, walking_downstairs, sitting, standing, laying).

## Feature Selection 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals TimeAcceleration-XYZ and TimeGyro-XYZ. These time domain signals (prefix 'Time') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAcceleration-XYZ and TimeGravityAcceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerationJerk-XYZ and TimeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerationMagnitude, TimeGravityAccelerationMagnitude, TimeBodyAccelerationJerkMagnitude, TimeBodyGyroMagnitude, TimeBodyGyroJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAcceleration-XYZ, frequencyBodyAccelerationJerk-XYZ, frequencyBodyGyro-XYZ, frequencyBodyAccJerkMagnitude, frequencyBodyGyroMagnitude, frequencyBodyGyroJerkMagnitude. 

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

In the original data set, a multitude of variables were estimated from these signals. This data set only contains:
- Mean: Mean value
- StandardDeviation: Standard deviation

The complete list of variables is available below. "mean" at the beginning of each variable name indicates that this is a mean value. 

 [1] "subjectid"                                               
 [2] "activity"                                             
 [3] "meanTimeBodyAccelerationMeanX"                              
 [4] "meanTimeBodyAccelerationMeanY"                              
 [5] "meanTimeBodyAccelerationMeanZ"                              
 [6] "meanTimeBodyAccelerationStandardDeviationX"                 
 [7] "meanTimeBodyAccelerationStandardDeviationY"                 
 [8] "meanTimeBodyAccelerationStandardDeviationZ"                 
 [9] "meanTimeGravityAccelerationMeanX"                           
[10] "meanTimeGravityAccelerationMeanY"                           
[11] "meanTimeGravityAccelerationMeanZ"                           
[12] "meanTimeGravityAccelerationStandardDeviationX"              
[13] "meanTimeGravityAccelerationStandardDeviationY"              
[14] "meanTimeGravityAccelerationStandardDeviationZ"              
[15] "meanTimeBodyAccelerationJerkMeanX"                          
[16] "meanTimeBodyAccelerationJerkMeanY"                          
[17] "meanTimeBodyAccelerationJerkMeanZ"                          
[18] "meanTimeBodyAccelerationJerkStandardDeviationX"             
[19] "meanTimeBodyAccelerationJerkStandardDeviationY"             
[20] "meanTimeBodyAccelerationJerkStandardDeviationZ"             
[21] "meanTimeBodyGyroMeanX"                                      
[22] "meanTimeBodyGyroMeanY"                                      
[23] "meanTimeBodyGyroMeanZ"                                      
[24] "meanTimeBodyGyroStandardDeviationX"                         
[25] "meanTimeBodyGyroStandardDeviationY"                         
[26] "meanTimeBodyGyroStandardDeviationZ"                         
[27] "meanTimeBodyGyroJerkMeanX"                                  
[28] "meanTimeBodyGyroJerkMeanY"                                  
[29] "meanTimeBodyGyroJerkMeanZ"                                  
[30] "meanTimeBodyGyroJerkStandardDeviationX"                     
[31] "meanTimeBodyGyroJerkStandardDeviationY"                     
[32] "meanTimeBodyGyroJerkStandardDeviationZ"                     
[33] "meanTimeBodyAccelerationMagnitudeMean"                      
[34] "meanTimeBodyAccelerationMagnitudeStandardDeviation"         
[35] "meanTimeGravityAccelerationMagnitudeMean"                   
[36] "meanTimeGravityAccelerationMagnitudeStandardDeviation"      
[37] "meanTimeBodyAccelerationJerkMagnitudeMean"                  
[38] "meanTimeBodyAccelerationJerkMagnitudeStandardDeviation"     
[39] "meanTimeBodyGyroMagnitudeMean"                              
[40] "meanTimeBodyGyroMagnitudeStandardDeviation"                 
[41] "meanTimeBodyGyroJerkMagnitudeMean"                          
[42] "meanTimeBodyGyroJerkMagnitudeStandardDeviation"             
[43] "meanFrequencyBodyAccelerationMeanX"                         
[44] "meanFrequencyBodyAccelerationMeanY"                         
[45] "meanFrequencyBodyAccelerationMeanZ"                         
[46] "meanFrequencyBodyAccelerationStandardDeviationX"            
[47] "meanFrequencyBodyAccelerationStandardDeviationY"            
[48] "meanFrequencyBodyAccelerationStandardDeviationZ"            
[49] "meanFrequencyBodyAccelerationJerkMeanX"                     
[50] "meanFrequencyBodyAccelerationJerkMeanY"                     
[51] "meanFrequencyBodyAccelerationJerkMeanZ"                     
[52] "meanFrequencyBodyAccelerationJerkStandardDeviationX"        
[53] "meanFrequencyBodyAccelerationJerkStandardDeviationY"        
[54] "meanFrequencyBodyAccelerationJerkStandardDeviationZ"        
[55] "meanFrequencyBodyGyroMeanX"                                 
[56] "meanFrequencyBodyGyroMeanY"                                 
[57] "meanFrequencyBodyGyroMeanZ"                                 
[58] "meanFrequencyBodyGyroStandardDeviationX"                    
[59] "meanFrequencyBodyGyroStandardDeviationY"                    
[60] "meanFrequencyBodyGyroStandardDeviationZ"                    
[61] "meanFrequencyBodyAccelerationMagnitudeMean"                 
[62] "meanFrequencyBodyAccelerationMagnitudeStandardDeviation"    
[63] "meanFrequencyBodyAccelerationJerkMagnitudeMean"             
[64] "meanFrequencyBodyAccelerationJerkMagnitudeStandardDeviation"         
[65] "meanFrequencyBodyGyroMagnitudeMean"                         
[66] "meanFrequencyBodyGyroMagnitudeStandardDeviation"            
[67] "meanFrequencyBodyGyroJerkMagnitudeMean"                     
[68] "meanFrequencyBodyGyroJerkMagnitudeStandardDeviation"
