#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

S = list()
A = list()

#fid = open("/Users/robertweigel/Desktop/git/cds301/NuGen.txt")
fid = open("/home/weigel/git/cds301/neugen/neugen.txt")
s = 0
a = 0
while 1:
	line = fid.readline()

	if not line:
		break

	if line.find("begin soma") == 0:
		S.append([])
		n = fid.readline()
		tmp = ""
		for x in range(0, int(n)):
			tmp += fid.readline()
		S[s] = tmp
		#print S[s]
		s = s+1

	if line.find("begin axon") == 0:
		A.append([])
		p = fid.readline()
		n = fid.readline()
		print n
		tmp = ""
		for x in range(0, int(n)):
			tmp += fid.readline()
		print tmp
		A[a] = tmp
		print A[a]
		a = a+1

fid.close()

for x in range(0, 2):
	# create a new 'Line'
	line1 = Line()

	# Properties modified on line1
	line1.Point1 = [-x, 0.0, 0.0]
	line1.Point2 = [1.5, 0.0, 0.0]

	# get active view
	renderView1 = GetActiveViewOrCreate('RenderView')

	# show data in view
	line1Display = Show(line1, renderView1)
	# trace defaults for the display properties.
	line1Display.ColorArrayName = [None, '']

	# reset view to fit data
	renderView1.ResetCamera()

#changing interaction mode based on data extents
renderView1.CameraViewUp = [1.0, 1.0, 0.0]

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.InteractionMode = '2D'
renderView1.CameraPosition = [0.0, 4.11879438337416, 4.11879438337416]
renderView1.CameraViewUp = [0.7071067811865475, 0.7071067811865475, 0.0]
renderView1.CameraParallelScale = 1.5075833772796048

#### uncomment the following to render all views
# RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).
