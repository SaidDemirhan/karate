Karate Nedir?
Karate, Web Servis Test (API Test) yazmak için oluşturulmuş bir framework diyebiliriz. Cucumber-JVM üzerine inşa edilmiştir ve testlerinizi Cucumber-Gherkin formatında yazabilirsiniz. Başta söylemek gerekirse Karate kullanarak Java kodu neredeyse hiç yazmadan web servis testlerinizi kolaylıkla yazabilirsiniz. Cucumber report kullanarak güzel görsel rapor oluşturabilirsiniz.  Karate REST ve SOAP desteklemektedir. SOAP için denemedim ama REST için kullanımının çok rahat olduğunu söyleyebilirim. Kullanımını kolaylaştıran en güzel özelliklerinden kısaca bahsedelim.

JUnit ve TestNG desteği vardır.
Jsonpath veya Xpath kullanılabilir.
Bir Feature’da başka bir Feature çağırabilir.
Global değişkenler tanımlanabilir.
JavaScript ve Java kodlarınızı “.feature” fileler içinde yazılabilir.
Call ve Callonce kullanarak tekrar tekrar senaryo yazmak zorunda kalmazsınız.
Daha fazla detay için karate github sayfasını ziyaret edebilirsiniz.

Karate Nasıl Çalışır ?

En başta belirtiğimiz gibi Cucumber-JVM üzerine inşa edildiği için sadece bir runner sınıfı yazıp Junit için @RunWith(Karate.class) ve @CucumberOptions annotation’da gerekli tanımlamaları yapıp çalışır. Arka planda JavaScript Nasnborn kullandığı javascript ve java kodlarını run edebilirsiniz. Ayrıca paralel çalıştırmak istediğiniz testler için KarateRunner’dan extend ettiğiniz bir sınıfı kullanarak testlerinizi paralel koşabilir ve rapor alınabilir.

Kısaca ne yapacağımızı anlatmak istiyorum. Karate ile web servis test otomasyonu yazmak için Maven veya Gradle kullanabilirsiniz. Şimdi küçük bir demo yapalım. Biz demomuzda Maven ve Junit kullanacaz. Mockoon ile mock REST API oluşturup response üzerinde data ve status kontrolü yapıcaz. Bir feature’den başka bir feature file çağıracaz.

Kısaca klasör yapısından bahsedelim. Karate her ne kadar feature fileları test package altında yazmamız gerektiğini söylesede ben Resources altında kullandım. Seçim size ait. Loglama için LogBack kullanılmış. Bunun için mutlaka logback-test.xml dosyasını oluşturmayı unutmayın.  Web servis ayarlarınız için karate-config.js dosyasını da oluşturmak zorundasınız. Bu konfigürasyon dosyasında timeout, proxy, url, ssl gibi ayarlarınızı yapabilirsiniz. Tüm seçenekler için linke tıklayabilirsiniz. Şimdi test projemize geçebiliriz.

Maven ile karate projemizi oluşturalım.

Maven ile Karate Archetype kullanarak projemizi oluşturduk. Projemizi IntelliJ Idea’da açtığımızda POM.xml ve Project Structure Resim-2 deki gibidir.

Mockoon uygulamasını kullanarak nöbetçi eczaneler için Resim-3’de gördüğünüz gibi küçük bir mock REST API oluşturduk.

-/pharmacies/city

-/pharmacies/city/{cityId}

Şimdi karate-config.js dosyamızı buna uygun düzenleyelim. Konfigürasyon dosyasında baseurl, port, api uçlarını tanımlıyoruz. Ssl, proxy gibi diğer ayarlarımızı yine ayni dosya üzerinde yapılandırıyoruz.

Şimdi resources folder altında featurelarimizi yazalım. Ilk feature dosyamızı city adlı klasör oluşturup altına “city.feature” file dosyası oluşturuyoruz. Mock REST API şehirleri listelemek icin request göndereceğiz. “GET” ile çektiğimiz response’da 8. şehir olan İstanbul’u variable olarak tanımlayacağız ve daha sonra İstanbul’daki  nöbetçi eczaneleri listelemek için kullanacağız.

Şimdi bu senaryoda neler yaptiğimizi adim adim inceleyelim:

Background kisminda base url’imizi daha once config dosyasinda tanimladigimiz adres olarak yaziyoruz.
Senaryomuza bir tag atiyoruz single test execute icin.
Given Step’inde ‘city’ path’ine request göndereceğimizi belirtiyoruz.
When metodunda GET ile request gönderiyoruz.
Then Step’inde gelen response ve status uzerinde kontrollerimizi yapiyoruz. İlk olarak status kontrolü yapıyoruz.
And Step’inde toplam şehir sayısını jsonpath kullanarak kontrol ediyoruz.
Def ile daha sonra başka bir feature da kullanmak üzere indexi 8 olan İstanbul’un id ve name değişkenlerini Response’dan alıyoruz ve print komutu ile logluyoruz.

PharmaciesByCity Tag’lı senaryomuzda şehirleri çektiğimiz feature’ı run ediyor, city/{cityCode} alanına “city.feature” daki citycode alanına atıyoruz ve gelen response üzerinde tum nöbetçi eczanelerin city bilgisinin aynı olduğunu kontrol ediyoruz.

Gördüğünüz gibi sadece CucumberRunner.java dosyasi olusturduk ve başka hiç bir kod yazmadan REST API testini tamamladik. Karate ile cok rahat bir şekilde tüm web servis testlerinizi yazabilirsiniz. SOAP için de kullanabilirsiniz veya SOAP için CitrusFramework ya da kendini Clientinizi WSDL ile CXF Maven Code Generator Plugin ile oluşturup hızlı bir şekilde testlerinizi yazabilirsiniz. Rest için Karate giderek popülerleşeceğini düşünüyorum. Vakit ayirip okuduğunuz için çok teşekkur ederim.
