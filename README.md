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

## Системные требования

MATLAB версии не ниже R2018b или [MATLAB Online](https://matlab.mathworks.com/)\*. Также требуется доступ к [MATLAB Drive](https://drive.matlab.com/) и [MATLAB Grader](https://grader.mathworks.com/).

Необходимые пакеты:
- Curve Fitting Toolbox
- Signal Processing Toolbox
- Statistics and Machine Learning Toolbox
- Symbolic Math Toolbox

\* *разделы "2.3. Лабораторные работы, 1.2.15. Восстановление пропусков и прогнозироавние, 1.2.18. Анализ и обработка аудиофайла в MATLAB" рекомендуется проходить в компьютерной версии MATLAB*

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