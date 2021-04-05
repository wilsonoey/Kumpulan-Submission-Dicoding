Untuk dapat melihat submission Saya di kelas **Memulai Pemrograman dengan Kotlin** , silakan klik link : 

https://www.dicoding.com/dicodingassets/academy_submissions/3S%253A%253ABVd1OKND0NoX%253A%253A5JwgOYaOrB40%253A%253Ar5gyb7p24PVw%253A%253A20210301080402ecc876d2d3eb0f7720be30bc831c30ba.zip


**Saran Reviewer**
    /**
     * Untuk menyelesaikan tugas latihan, Anda tidak diperbolehkan mengubah struktur kode yang sudah ada. Kecuali:
     *    - Untuk melakukan improvisasi kode
     *    - Mengikuti perintah yang ada
     *
     * Cukup tambahkan kode berdasarkan perintah yang sudah ditentukan.
     *
     */
     
    fun main() {
     
        // TODO 1
        val vehicle = mapOf<String, String>("type" to "Motorcycle","maxSpeed" to "230Km/s","maxTank" to "10Ltr")
        //SOLUSI 1
        //Penggunaan <String,String> pada mapOf ini tidak diperlukan bila memiliki tipe data yang jelas
        //val vehicle = mapOf("type" to "Motorcycle","maxSpeed" to "230Km/s","maxTank" to "10Ltr")
     
        // TODO 2
        val type = vehicle.getValue("type")
        //SOLUSI 2
        //Anda juga dapat melakukannya dengan seperti ini
        //val type = vehicle["type"] 

        val maxSpeed = vehicle.getValue("maxSpeed")
        val maxTank = vehicle.getValue("maxTank")
     
        // TODO 3
        println("Vehicle")
        println("Type: $type")
        println("Maximal Speed: $maxSpeed")
        println("Maximal Tank: $maxTank")
    }
