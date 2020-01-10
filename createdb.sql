create table budget(
    codename varchar(255) primary key,
    daily_limit integer
);

create table category(
    codename varchar(255) primary key,
    name varchar(255),
    is_base_expense boolean,
    aliases text
);

create table expense(
    id integer primary key,
    user_id integer,
    amount integer,
    created datetime,
    category_codename integer,
    raw_text text,
    FOREIGN KEY(category_codename) REFERENCES category(codename)
);

insert into category (codename, name, is_base_expense, aliases)
values
    ("products", "food", true, "еда, food, grocery, groceries"),
    ("amazon", "amazon", true, "amazon"),
    ("coffee", "кофе", true, ""),
    ("lunch", "обед", true, "столовая, ланч, бизнес-ланч, бизнес ланч, lunch"),
    ("cafe", "кафе", true, "cafe, ресторан, рест, мак, макдональдс, макдак, kfc, ilpatio, il patio"),
    ("transport", "транспорт", false, "taxi, ferry, метро, автобус, metro"),
    ("taxi", "такси", false, "яндекс такси, yandex taxi"),
    ("phone", "телефон", false, "теле2, связь, phone, cell, inet, comcast"),
    ("books", "книги", false, "литература, литра, лит-ра"),
    ("subscriptions", "подписки", false, "подписка"),
    ("other", "прочее", true, "");

insert into budget(codename, daily_limit) values ('base', 500);
