# Шум Перлина На Perl

1. **Генерация градиентов:** Функция random_gradient создает случайный градиент для каждой точки сетки.
2. **Выбор значений:** Функция perlin_noise использует эти градиенты, чтобы вычислить значения шума на основе двухмерной сетки.
3. **Вывод:** Генерируется текстовое представление шума, где каждое значение отображается соответствующим символом:

    ``` ``` (пробел) для низких значений;
   
    ```.``` для значений чуть выше нуля;
   
    ```*``` для промежуточных значений;
   
    ```#``` и ```@``` для высоких значений.

### Как запустить код
1. Склонируйте репозиторий:

   ```bash
   git clone https://github.com/SL1dee36/perlin_noise.git
   cd perlin_noise
   ```
2. Откройте терминал и выполните команду:
     ```bash
     perl perlin_noise.pl
     ```

Вы увидите текстовое представление шума Перлина, которое будет отображаться в консоли. 
Вы можете экспериментировать с размерами и масштабом, чтобы увидеть, как это влияет на результат. 
Если у вас есть дополнительные вопросы или пожелания, дайте знать!


```
@ @ @ # # @ @ @ @ # # # # # # @ @ @ 
@ # * * * # * * # # # * * * # # @ @ 
# * * * * * * * * * * * * * * # @ @ 
# * * * * * * * * * * * * * * * # @ 
* * * * * * * * * * * * * * * * * # 
* * * * * * * * * * * * * * * * * # 
* * * * * * * * * * * * * * * * * # 
* * * * * * * * * * * * * * * * * * 
# * * * * * * * * * * * * * * * * * 
@ @ # # * * * * * * * * * * * # # @ 
@ # * * * * * * * * * * * * # # @ @ 
@ @ # # # # # * * * * * * # @ @ @ @ 
@ @ @ @ @ @ # * * * * # # # @ @ @ @ 
```
