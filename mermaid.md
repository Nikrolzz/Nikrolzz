## Mermaid

**Mermaid** - это упрощенный и далекий аналог UML - специальный язык описания блок-схем, графиков и диаграмм с их визуализацией.

> ** Самостоятельно доделать это ридми**

### Блок схемы

#### Базовая структура 1
```mermaid
flowchart LR
    A[Вопрос: Как сделать список?] --> B["Ответ: `-` или `*`"]
    A --> C["Пример: \n -Пункт 1 \n"]

```
* flowchart - блок-схема
* LR - направление вправо
* A[],B[],C[] - прямоугольник
* --> - cтрелка связи
#### Базовая структура 2
```mermaid
graph TD
    A[Начало] --> B{Условие}
    B -->|Да| C[Действие 1]
    B -->|Нет| D[Действие 2]
    C --> E[Конец]
    D --> E
```

#### Полный синтаксис блок-схем
```mermaid
graph TD
    A[Прямоугольник]
    B(Скругленный)
    C{Ромб}
    D((Круг))
    E>Асимметричный]
    F{{Шестиугольник}}

    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
```

### Диаграмма последовательностей
```mermaid
sequenceDiagram
    participant A as Катя
    participant B as Дима
    A->>B: Привет, Дима!
    B->>A: Привет, Катя!
    A->>B: Как дела?
    Note right of B: Дима думает
    B-->>A: Отлично!

    loop Каждый день
        A->>B: Напоминание
    end

    alt Если занят
        B->>A: Перезвоню
    else Если свободен
        B->>A: Готов общаться
    end
```

### Диаграмма класса
```mermaid
classDiagram
    class Animal {
        +String name
        #int age
        -String species
        +makeSound() void
        +eat() abstract
    }

    class Dog {
        +String breed
        +bark() void
    }

    class Cat {
        +Boolean isIndoor
        +meow() void
    }

    Animal <|-- Dog
    Animal <|-- Cat
    Dog *-- Owner : has
```
### Диаграмм Ганта

```mermaid
gantt
    title План проекта
    dateFormat YYYY-MM-DD
    axisFormat %d/%m

    section Разработка
    Анализ требований :a1, 2024-01-01, 7d
    Проектирование :a2, after a1, 5d
    Реализация :a3, after a2, 14d

    section Тестирование
    Модульное тестирование :b1, after a2, 10d
    Интеграционное тестирование :b2, after a3, 7d
```

### Граф зависимостей
```mermaid
graph RL
    subgraph Frontend
        A[React]
        B[Vue.js]
    end

    subgraph Backend
        C[Node.js]
        D[Database]
    end

    A --> C
    B --> C
    C --> D

```

### Диаграмма состояний
```mermaid
stateDiagram-v2
    [*] --> Idle
    Idle --> Processing : start
    Processing --> Success : completed
    Processing --> Error : failed
    Success --> [*]
    Error --> [*]

    state Processing {
        [*] --> Initializing
        Initializing --> Working : initialized
        Working --> Finalizing : done
        Finalizing --> [*]
    }
```

### Юзер-джайрни
```mermaid
journey
    title Покупка товара
    section Авторизация
      Вход на сайт: 5: Пользователь
      Ввод пароля: 3: Пользователь
    section Оплата
      Выбор карты: 6: Пользователь
```

### Кастомизация стилей
```mermaid
%%{init: {'theme':'dark'}}%%
graph LR
    A[Темная тема] --> B[Стилизовано]
```

### Классы CSS
```mermaid
graph LR
    A:::red --> B:::blue

    classDef red fill:#f96
    classDef blue fill:#69f,color:#fff
```

### Интерактиваность
```mermaid
graph LR
    A[Посетить сайт] --> B(Документация)

    click A "https://github.com" "Открыть GitHub"
    click B call alert() "Вызвать JS-функцию"
```

### Круговая диаграмма
```mermaid
pie
    title OC на десктопе
    "Windows" : 70
    "MacOS" : 20
    "Linux" : 7
    "Other" : 3
```
