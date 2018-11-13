# Учебный курс «MATLAB для преподавателей»

Учебный курс для обучения преподавателей высших учебных заведений основам MATLAB и преподаванию с помощью MATLAB. Включает в себя следующие разделы:

- Введение в MATLAB
- Анализ данных в MATLAB
- Программирование и математика
- Создание лекций
- Проверка домашних заданий
- Лабораторные работы
- материалы для наполнения курсов

Курс содержит файлы для занятий в классе и самостоятельной работы.

[Содержание курса и часы](https://docs.google.com/spreadsheets/d/1Zwa-TNBuha81ZPdPktJBAF-njLsbAHdAIihAORB5p3E)

## Системные требования

MATLAB версии не ниже **R2018b** или [MATLAB Online](https://matlab.mathworks.com/)\*. Также требуется доступ к [MATLAB Drive](https://drive.matlab.com/) и [MATLAB Grader](https://grader.mathworks.com/).

**Необходимые пакеты:**
- Curve Fitting Toolbox
- Optimization Toolbox
- Signal Processing Toolbox
- Statistics and Machine Learning Toolbox
- Symbolic Math Toolbox

\* *разделы "2.3. Лабораторные работы", "1.2.15. Восстановление пропусков и прогнозироавние", "1.2.18. Анализ и обработка аудиофайла в MATLAB" рекомендуется проходить в настольной версии MATLAB*

## Установка

### Способ 1

Скачайте и запустите файл [MATLAB-Course-for-Educators.mltbx](https://github.com/ETMC-Exponenta/MATLAB-Course-for-Educators/raw/master/MATLAB-Course-for-Educators.mltbx)

### Способ 2

Выполните в MATLAB
```MATLAB
r = webread('https://api.github.com/repos/ETMC-Exponenta/MATLAB-Course-for-Educators/releases/latest');
websave(r.assets.name, r.assets.browser_download_url);
open(r.assets.name)
```

## Как получить доступ к самостоятельным работам в MATLAB Grader?

Напишите нам на почту tech@exponenta.ru письмо по следующему образцу:

**Тема:** Доступ к заданиям курса "MATLAB для преподавателей" в MATLAB Grader

**Текст (примерный):**

Здравствуйте. Меня зовут *<ФИО>*, я преподаю в  *<название ВУЗа>* дисциплины *<название предметов>*. Прошу предоставить мне доступ к заданиям курса, чтобы я мог их переиспользовать для обучения студентов/преподавателей. *<Другая информация, которую вы хотите предоставить>*. Прошу переадресовать письмо Денису Жегалину.


## Нашли ошибку? Хотите помочь?

Если вы хотите принять участие в доработке курса, напишите нам по адресу tech@exponenta.ru письмо по следующему образцу:

**Тема:** Доработка курса "MATLAB для преподавателей"

**Текст (примерный):**

Здравствуйте. Меня зовут *<ФИО>*, я преподаю в  *<название ВУЗа>* дисциплины *<название предметов>*. Я нашел ошибку/хочу принять участие в создании курса. *<Другая информация, которую вы хотите предоставить>*. Прошу переадресовать письмо Денису Жегалину.
