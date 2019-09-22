; Engine of the hex clock

(import datetime)

(setv HEX-SECONDS (** 16 4))
(setv TRADITIONAL-SECONDS (* 24 60 60))

(defn float-to-hex [f]
    (hex (round f)))

(defn decorate-hex [i]
    (.format "{0:#0{1}x}" i 6))

(defn decorate-traditional [now]
    (.format "{}:{}" now.hour now.minute))

(defn get-seconds-since-midnight []
    (setv now (datetime.datetime.now))
    (setv midnight (.replace now :hour 0
                        :minute 0
                        :second 0
                        :microsecond 0))
    (setv secs (- now midnight))
    secs.seconds)

(defn get-hex-time []
    (setv ratio-now (/ (* (get-seconds-since-midnight) HEX-SECONDS) TRADITIONAL-SECONDS))
    (-> ratio-now (round) (decorate-hex) (cut 0 5)))

(defn get-traditional-time []
    (decorate-traditional (datetime.datetime.now)))
