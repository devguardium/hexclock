; Engine of the hex clock

(import datetime)

(setv HEX-SECONDS (** 16 4))
(setv TRADITIONAL-SECONDS (* 24 60 60))

(defn float-to-hex [f]
    (hex (round f)))

(defn decorate-hex [i]
    (.format "{0:#0{1}x}" i 6))

(defn decorate-traditional [now]
    (.format "{:02d}:{:02d}" now.hour now.minute))

(defn get-seconds-since-midnight []
    (setv now (datetime.datetime.now))
    (setv midnight (.replace now :hour 0
                        :minute 0
                        :second 0
                        :microsecond 0))
    (setv secs (- now midnight))
    secs.seconds)

(defn get-hex-time [traditional-time-seconds]
    (setv ratio-now (/ (* traditional-time-seconds HEX-SECONDS) TRADITIONAL-SECONDS))
    (-> ratio-now (round) (decorate-hex) (cut 0 5)))

(defn get-traditional-time []
    (decorate-traditional (datetime.datetime.now)))

(defn traditional-to-hex [traditional]
    (setv hours (int (cut traditional 0 2)))
    (setv minutes (int (cut traditional 3 5)))

    (setv hex_seconds (+ (* hours 3600) (* minutes 60)))

    (get-hex-time hex-seconds))

(defn hex-to-traditional [hex]
    (setv traditional-seconds (round (/ (* (int (+ "0x" hex "0") 16) TRADITIONAL-SECONDS) HEX-SECONDS)))
    (setv hours (// traditional-seconds 3600))
    (setv minutes (// (% traditional-seconds 3600) 60))
    (.format "{:02d}:{:02d}" hours minutes))
