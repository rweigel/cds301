#### import the simple module from the paraview
from paraview.simple import *

print ""
for s in GetSources():
    print "Deleting " + s[0]
    Delete(FindSource(s[0]))

# or
# for s in GetSources().values():
#     Delete(s)

print "Executing Macro cone.py"

#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'Cone'
cone1 = Cone()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [926, 636]

# show data in view
cone1Display = Show(cone1, renderView1)
# trace defaults for the display properties.
cone1Display.ColorArrayName = [None, '']

# reset view to fit data
renderView1.ResetCamera()

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [-1.5887172973294839, -0.8056332546185571, -2.6627189165508365]
renderView1.CameraViewUp = [-0.28835910551008903, -0.8551459961527149, 0.43078341603803916]
renderView1.CameraParallelScale = 0.8291561935301535

#### uncomment the following to render all views
Render()
# alternatively, if you want to write images, you can use SaveScreenshot(...).