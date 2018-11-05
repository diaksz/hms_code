import os
import matplotlib.pyplot as plt
import numpy as np
import cv2
import sys
from matplotlib.widgets import Button

# Setup file stuff
cd = os.getcwd()
files = os.listdir(cd)
lst = []
lst2 = []
blist = []
#f = open("moved_files.lst",'w')
plt.gray()
plt.close()
# Set up figures with buttons

if __name__ == "__main__":
	dataset = sys.argv[1] 
        start = sys.argv[2]
	end = sys.argv[3]
	class callbacks():

            def plot_1(self,event):
                print 'Keeping image'
                plt.close()
            def plot_2(self,event):
                os.rename(self.fname,cd+'%s_bad_acq/%s'%(dataset,self.fname))
                print '%s moved to bad_acq'%self.fname	
                plt.close()
            def __init__(self,im,fname):
                self.fname = fname
                self.im = im
                plt.figure()
                plt.imshow(im)
                self.ax = plt.subplot()
                plt.subplots_adjust(bottom=0.2)
                plt.title(fname,pad=10)
                self.ax1 = plt.axes([0.7, 0.05, 0.1, 0.075])
                self.ax2 = plt.axes([0.81, 0.05, 0.1, 0.075])
                self.ba = Button(self.ax1,'Keep')
                self.bb = Button(self.ax2,'Bad Acq')
                self.ba.on_clicked(self.plot_1)
                self.bb.on_clicked(self.plot_2)


	for i in files:
		if not i[-1].isdigit():
			files.remove(i)
	files = sorted(files)
	# Files now contains only the sections
	for i in range(int(start),int(end) + 1):
		for section in files:
			if str(i) == section[-3:]:
				lst.append(section)
		print "%s: "%i
		print lst	
		for montage in lst:
			if not os.path.exists('%s/%s_coarse_montage.tif'%(montage,montage)):
				os.rename(montage,cd + '%s_trash/%s'%(dataset,montage)
				print '%s moved to trash'%montage			
			else:
				print montage
				im = cv2.imread('%s/%s_coarse_montage.tif'%(montage,montage),0)
				blist.append(callbacks(im,montage))
		plt.show()
		lst = []
	print 'done'
	sys.exit()
		 
