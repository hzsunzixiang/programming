from django.http import HttpResponse
import commands
c = commands.getoutput
GPATH = '/home/lee/webapps/media/'
def draw(request):
   angle = request.POST.get('angle', "0")
   speed = request.POST.get('speed', "0")
   try:
      angle = float(angle)
      speed = float(speed)
   except:
      warning = """Enter numbers: the angle should be positive and less than 90 degrees and the speed
                   must be positive."""
   else:
      if not ( 0<=angle<=90 and 0<=speed ):
         warning = """The angle should be positive and less than 90 degrees and the speed
                      must be positive."""
         angle = "0"
         speed = "0"
      else:
         warning = ''
         gnuplotscript ='g = 9.8; a = %s; v = %s; set angle degrees; set term png; set out "%scannongraph.png"; set parametric; set samp 5000; set trange [0:1000]; set yrange [0:1000]; set xrange [0:1000]; plot v*cos(a)*t, v*sin(a)*t-g/2.*t**2 lw 5 title "Trajectory"' % (angle, speed, GPATH)
         c('gnuplot -e \'%s\'' % gnuplotscript)
   page = """
   <!DOCTYPE HTML> 
   <head><meta content="text/html;charset=utf-8" http-equiv="Content-Type">
   <title>Aim the Cannonball</title> 
   </head><body>
   <h1>Aim the Cannonball</h1>
   <p style = "width:32em;">Enter values for the angle from the horizontal, in degrees, of the cannon, and the inital speed of the cannonball. Your goal is for the ball to hit the ground at x = 1,000 meters. Gravity is that of earth, 9.8 meters/second<sup>2</sup>.
   </p>
   <form name = "cannon" action = "/cannongraph/" method = "post">
    <img src = "/cannongraph.png" width= "400" /><br />
   Cannon angle: <input type = "text" size = "4" name = "angle" value = "%s"> &nbsp;
   Initial speed: <input type = "text" size = "4" name="speed" value = "%s"> &nbsp;
   <input type="submit" name = "fire" value = "Fire!" />
   </form>
   <p style = "color:red; width:32em;">%s</p>
   </body></html>
   """ % (angle, speed, warning)
   response = HttpResponse(page)
   response['Cache-Control'] = 'no-cache'
   return response
