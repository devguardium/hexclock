(import hexengine)

(defn create-traditional-to-hex-file []
    (with [f (open "traditional-to-hex" "w")]
        (for [i (range 23) j [0 15 30 45]]
            (.write f
                (.format "{} - {}\n"
                    (.format "{:02d}:{:02d}" i j)
                    (hexengine.traditional-to-hex (.format "{:02d}:{:02d}" i j)))))))

(create-traditional-to-hex-file)