; A Simple Hy Hex Clock implementation on TKinter
; View module

(import [tkinter [Tk StringVar Label Entry]])
(import hexengine)

(setv root (Tk))

(doto root
    (.title "Hex Clock")
    (.geometry "324x324")
    (.resizable 0 0))

; Hex time label
(setv var-hex-time (StringVar))

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


(defn tick []
    (.set var-hex-time (hexengine.get-hex-time))
    (.set var-traditional-time (hexengine.get-traditional-time))
    (.after root 100 tick))


(tick)

(.mainloop root)


