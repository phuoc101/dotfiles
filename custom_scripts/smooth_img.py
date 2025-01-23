#!/usr/bin/env python3

import numpy as np
import cv2 as cv
 
fname = "nord_water_warrior.jpg"
img = cv.imread(fname)
assert img is not None, "file could not be read, check with os.path.exists()"
 
kernel = np.ones((5,5),np.float32)/25
dst = cv.filter2D(img,-1,kernel)
cv.imwrite("smooth_" + fname, dst)
#  
# plt.subplot(121),plt.imshow(img),plt.title('Original')
# plt.xticks([]), plt.yticks([])
# plt.subplot(122),plt.imshow(dst),plt.title('Averaging')
# plt.xticks([]), plt.yticks([])
# plt.show()
