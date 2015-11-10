#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'Cylinder'
cylinder1 = Cylinder()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [1024, 1351]

# show data in view
cylinder1Display = Show(cylinder1, renderView1)
# trace defaults for the display properties.
cylinder1Display.ColorArrayName = [None, '']

# reset view to fit data
renderView1.ResetCamera()

# change solid color
cylinder1Display.DiffuseColor = [0.0, 0.0, 1.0]

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [-3.040617565940709, -2.208006980345092, 1.7985164445592823]
renderView1.CameraViewUp = [0.59773199731008, -0.18840110171395777, 0.7792441749956619]
renderView1.CameraParallelScale = 1.0939355639250365

#### uncomment the following to render all views
RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).