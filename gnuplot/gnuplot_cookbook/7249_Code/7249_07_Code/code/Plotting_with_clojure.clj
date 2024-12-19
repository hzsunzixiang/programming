(require '[org.shender.clojure-gnuplot :as gnuplot])
(def gp (gnuplot/start))
(gnuplot/exec gp
 (unset key)
 (set xrange (range -5 5))
 (plot (sin (/ 1 x)) with dots))
(gnuplot/stop gp)
