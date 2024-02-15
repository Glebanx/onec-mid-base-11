Процедура ДополнитьФорму(Форма) Экспорт
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицо(Форма.Элементы);
		ДополнитьДокументСкидкой(Форма.Элементы, Форма.Команды);
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицо(Форма.Элементы);
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицо(Форма.Элементы);
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицо(Форма.Элементы);
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицо(Форма.Элементы);
	КонецЕсли;	
КонецПроцедуры


Процедура ДобавитьПолеКонтактноеЛицо(Элементы)
	НовыйЭлемент = Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), Элементы.Договор.Родитель, Элементы.Договор);
	НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
	НовыйЭлемент.ПутьКДанным = "Объект.ДОР_КонтактноеЛицо";
	Элементы.Переместить(Элементы.Договор, Элементы.Договор.Родитель, Элементы.КонтактноеЛицо); 
КонецПроцедуры

Процедура ДополнитьДокументСкидкой(Элементы, Команды)
	НоваяГруппа = Элементы.Добавить("ГруппаСкидка", Тип("ГруппаФормы"), Элементы.ГруппаШапкаЛево);
	НоваяГруппа.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	НоваяГруппа.Группировка = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда;
	
	НовыйЭлемент = Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"), НоваяГруппа);
	НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
	НовыйЭлемент.ПутьКДанным = "Объект.ДОР_СогласованнаяСкидка";
	НовыйЭлемент.УстановитьДействие("ПриИзменении", "СкидкаПриИзменении"); 
	
	НоваяКоманда    		 = Команды.Добавить("ПересчитатьСкидку");
	НоваяКоманда.Действие     = "ПересчитатьСкидку";
	
	ЭлементКоманда    			 = Элементы.Добавить("ПересчитатьСкидку", Тип("КнопкаФормы"), НоваяГруппа);
	ЭлементКоманда.Заголовок     = "Пересчитать cкидку";
	ЭлементКоманда.ИмяКоманды     = "ПересчитатьСкидку";
	ЭлементКоманда.Картинка = БиблиотекаКартинок.Перечитать;
	ЭлементКоманда.Отображение = ОтображениеКнопки.КартинкаИТекст;
КонецПроцедуры
