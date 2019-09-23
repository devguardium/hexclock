(import hexengine)

(defn create-traditional-to-hex-file []
    (with [f (open "traditional-to-hex" "w")]
        (for [i (range 23) j [0 15 30 45]]
            (.write f
                (.format "{} - {}\n"
                    (.format "{:02d}:{:02d}" i j)
                    (hexengine.traditional-to-hex (.format "{:02d}:{:02d}" i j)))))))

(defn create-hex-to-traditional-file []
    (with [f (open "hex-to-traditional" "w")]
        (for [h ["0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "a" "b" "c" "d" "e" "f"] m ["00" "40" "80" "C0"]]
            (.write f
                (.format "{} - {}\n"
                    (.format "{}{}" h m)
                    (hexengine.hex-to-traditional (.format "{}{}" h m)))))))


(create-traditional-to-hex-file)

(create-hex-to-traditional-file)