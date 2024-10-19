#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw(min max);

# Настройки
my $width = 80;     # Ширина изображения
my $height = 20;    # Высота изображения
my $scale = 0.1;    # Масштаб шума

# Функция для генерации случайного градиента
sub random_gradient {
    my ($x, $y) = @_;
    my $angle = rand(2 * 3.141592653589793); # 2 * PI
    return (cos($angle), sin($angle));
}

# Функция для вычисления градиента
sub gradient {
    my ($x, $y, $gx, $gy) = @_;
    my $dx = $x - int($x);
    my $dy = $y - int($y);
    return ($gx * $dx + $gy * $dy);
}

# Функция для получения шума Перлина
sub perlin_noise {
    my ($x, $y) = @_;
    my $x0 = int($x);
    my $x1 = $x0 + 1;
    my $y0 = int($y);
    my $y1 = $y0 + 1;

    my ($gx0, $gy0) = random_gradient($x0, $y0);
    my ($gx1, $gy1) = random_gradient($x1, $y0);
    my ($gx0y1, $gy0y1) = random_gradient($x0, $y1);
    my ($gx1y1, $gy1y1) = random_gradient($x1, $y1);

    my $n0 = gradient($x, $y, $gx0, $gy0);
    my $n1 = gradient($x, $y, $gx1, $gy1);
    my $n2 = gradient($x, $y, $gx0y1, $gy0y1);
    my $n3 = gradient($x, $y, $gx1y1, $gy1y1);

    my $u = $x - $x0;
    my $v = $y - $y0;
    
    my $nx0 = $n0 + $u * ($n1 - $n0);
    my $nx1 = $n2 + $u * ($n3 - $n2);
    
    return $nx0 + $v * ($nx1 - $nx0);
}

# Генерация и вывод шума
for my $y (0 .. $height - 1) {
    for my $x (0 .. $width - 1) {
        my $value = perlin_noise($x * $scale, $y * $scale);
        my $char = ' ';
        if ($value < -0.3) {
            $char = '.';
        } elsif ($value < 0) {
            $char = '*';
        } elsif ($value < 0.3) {
            $char = '#';
        } else {
            $char = '@';
        }
        print $char;
    }
    print "\n";
}
