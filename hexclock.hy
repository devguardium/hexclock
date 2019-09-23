; A Simple Hy Hex Clock implementation on TKinter
; View module

(import [tkinter [Tk StringVar Label Entry Button]])
(import hexengine)

(setv root (Tk))

(doto root
    (.title "Hex Clock")
    (.geometry "324x216")
    (.resizable 0 0))

; Hex time label
(setv var-hex-time (StringVar))

; Converted time label
(setv var-converted-time (StringVar))

(setv hex-time-label (Label root
                            :textvariable var-hex-time
                            :font "Helvetica 32 bold italic"))
(.pack hex-time-label)

; Traditional time label
(setv var-traditional-time (StringVar))

(setv traditional-time-label (Label root
                            :textvariable var-traditional-time
                            :font "Helvetica 16"))


(.pack traditional-time-label)

(setv time-to-check-entry (Entry root
                    :width 54))

(.pack time-to-check-entry)


; Convert Button

(defn convert-time []
    (setv time (.get time-to-check-entry))
    (if (> (.find time ":") 0)
        (.set var-converted-time (hexengine.traditional-to-hex time))
        (.set var-converted-time (hexengine.hex-to-traditional time))))


(setv convert-button (Button root
                        :text "Convert"
                        :command convert-time))
(.pack convert-button)

; Converted time label

(setv converted-time-label (Label root
                            :textvariable var-converted-time
                            :font "Helvetica 16"))


(.pack converted-time-label)



(defn tick []
    (.set var-hex-time (hexengine.get-hex-time (hexengine.get-seconds-since-midnight)))
    (.set var-traditional-time (hexengine.get-traditional-time))
    (.after root 100 tick))


(tick)

(.mainloop root)


