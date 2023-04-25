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
