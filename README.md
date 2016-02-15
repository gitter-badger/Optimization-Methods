# Методы оптимизации
## Запуск 
В каждом проекте уже лежит исполняемый файл `lab.jar`. Для запуска в папке с проектом необходимо выполнить `java -jar lab.jar` и передать соответствующие аргументы(все параметры передаются только как аргументы командной строки).
## Сборка
Если вам вдруг понадобилось внести изменения в исходный код программы то для того чтобы собрать проект вам необходимо будет обзавестись [SBT](http://www.scala-sbt.org), потом перейти в консоли в папку с проектом и выполнить `sbt assembly`, после чего в `target/scala-2.11` появится jar файл.
