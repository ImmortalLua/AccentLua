script_name('Accent for samp') -- Название Скрипта
script_author('Immortal-') -- Автор

require "lib.moonloader" -- Подключаем библиотеку Moonloader
local imgui = require 'imgui' -- Подключаем Imgui
local key = require 'vkeys' -- Подключаем использования кнопок
local encoding = require 'encoding' -- Подключаем кодировку
local inicfg = require 'inicfg' -- Подключаем работу с конфигом
local sampev = require 'lib.samp.events' -- Подключаем работу с самим Сампом
encoding.default = 'CP1251' -- Стандартная кодировка
u8 = encoding.UTF8 -- Кодировка для UTF8 

-- Стиль
function apply_custom_style()
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4

	style.WindowRounding = 2.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	style.ChildWindowRounding = 2.0
	style.FrameRounding = 2.0
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0

	colors[clr.FrameBg]								= ImVec4(0.48, 0.16, 0.16, 0.54)
	colors[clr.FrameBgHovered]				 = ImVec4(0.98, 0.26, 0.26, 0.40)
	colors[clr.FrameBgActive]					= ImVec4(0.98, 0.26, 0.26, 0.67)
	colors[clr.TitleBg]								= ImVec4(0.04, 0.04, 0.04, 1.00)
	colors[clr.TitleBgActive]					= ImVec4(0.48, 0.16, 0.16, 1.00)
	colors[clr.TitleBgCollapsed]			 = ImVec4(0.00, 0.00, 0.00, 0.51)
	colors[clr.CheckMark]							= ImVec4(0.98, 0.26, 0.26, 1.00)
	colors[clr.SliderGrab]						 = ImVec4(0.88, 0.26, 0.24, 1.00)
	colors[clr.SliderGrabActive]			 = ImVec4(0.98, 0.26, 0.26, 1.00)
	colors[clr.Button]								 = ImVec4(0.98, 0.26, 0.26, 0.40)
	colors[clr.ButtonHovered]					= ImVec4(0.98, 0.26, 0.26, 1.00)
	colors[clr.ButtonActive]					 = ImVec4(0.98, 0.06, 0.06, 1.00)
	colors[clr.Header]								 = ImVec4(0.98, 0.26, 0.26, 0.31)
	colors[clr.HeaderHovered]					= ImVec4(0.98, 0.26, 0.26, 0.80)
	colors[clr.HeaderActive]					 = ImVec4(0.98, 0.26, 0.26, 1.00)
	colors[clr.Separator]							= colors[clr.Border]
	colors[clr.SeparatorHovered]			 = ImVec4(0.75, 0.10, 0.10, 0.78)
	colors[clr.SeparatorActive]				= ImVec4(0.75, 0.10, 0.10, 1.00)
	colors[clr.ResizeGrip]						 = ImVec4(0.98, 0.26, 0.26, 0.25)
	colors[clr.ResizeGripHovered]			= ImVec4(0.98, 0.26, 0.26, 0.67)
	colors[clr.ResizeGripActive]			 = ImVec4(0.98, 0.26, 0.26, 0.95)
	colors[clr.TextSelectedBg]				 = ImVec4(0.98, 0.26, 0.26, 0.35)
	colors[clr.Text]									 = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled]					 = ImVec4(0.50, 0.50, 0.50, 1.00)
	colors[clr.WindowBg]							 = ImVec4(0.06, 0.06, 0.06, 0.94)
	colors[clr.ChildWindowBg]					= ImVec4(1.00, 1.00, 1.00, 0.00)
	colors[clr.PopupBg]								= ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.ComboBg]								= colors[clr.PopupBg]
	colors[clr.Border]								 = ImVec4(0.43, 0.43, 0.50, 0.50)
	colors[clr.BorderShadow]					 = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.MenuBarBg]							= ImVec4(0.14, 0.14, 0.14, 1.00)
	colors[clr.ScrollbarBg]						= ImVec4(0.02, 0.02, 0.02, 0.53)
	colors[clr.ScrollbarGrab]					= ImVec4(0.31, 0.31, 0.31, 1.00)
	colors[clr.ScrollbarGrabHovered]	 = ImVec4(0.41, 0.41, 0.41, 1.00)
	colors[clr.ScrollbarGrabActive]		= ImVec4(0.51, 0.51, 0.51, 1.00)
	colors[clr.CloseButton]						= ImVec4(0.41, 0.41, 0.41, 0.50)
	colors[clr.CloseButtonHovered]		 = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.CloseButtonActive]			= ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.PlotLines]							= ImVec4(0.61, 0.61, 0.61, 1.00)
	colors[clr.PlotLinesHovered]			 = ImVec4(1.00, 0.43, 0.35, 1.00)
	colors[clr.PlotHistogram]					= ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered]	 = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.ModalWindowDarkening]	 = ImVec4(0.80, 0.80, 0.80, 0.35)
end
apply_custom_style()
-- Стиль

local main_window_state = imgui.ImBool(false) -- Окно ImGui

-- Ини файл
local mainIni = inicfg.load({ -- создаем конфиг
	config =
	{
		accent = false, -- Сохраняем акцент
		text_accent = " " -- Сохраняем текст акцента
	}
	}, 
"Accent")

local accent = imgui.ImBool(mainIni.config.accent) -- Делаем переменную для акцента
local text_accent = imgui.ImBuffer(''..mainIni.config.text_accent, 500) -- Делаем переменную для текста акцента

local status = inicfg.load(mainIni, 'Accent.ini')  -- подгружаем конфиг
if not doesFileExist('moonloader/config/Accent.ini') then -- Проверка, если конфиг существует
	inicfg.save(mainIni, 'Accent.ini') -- Сохраняем конфиг
end
-- Ини файл

-- Регистрация команды
function cmd_accent(arg) -- Начало функции
	main_window_state.v = not main_window_state.v -- Открываем окно main_window_state
	imgui.Process = main_window_state.v -- Активируем процесс
end -- Конец функции
-- Регистрация команды

function imgui.OnDrawFrame() -- Вывод ImGui
	-- Закрытие процесса
	if not main_window_state.v then -- Проверка, если main_window_state не используется
		imgui.Process = false -- Отключаем процесс
	end	-- Конец проверки
	-- Закрытие процесса

	-- Установка Позиции
	if not window_pos then
		ScreenX, ScreenY = getScreenResolution()ScreenX, ScreenY = getScreenResolution() -- Получаем разрешение экрана
		imgui.SetNextWindowPos(imgui.ImVec2(ScreenX / 2 , ScreenY / 2), imgui.Cond.FirsUseEver, imgui.ImVec2(0.5, 0.5)) -- Установка позиции по центру экрана
	end	-- Конец проверки
	-- Установка Позиции

	if main_window_state.v then -- Проверка, если main_window_state используется
		imgui.SetNextWindowSize(imgui.ImVec2(450, 200), imgui.Cond.FirstUseEver) -- Установка разрешения
		imgui.Begin('[Акцент] Окно с настройками', main_window_state) -- Начало ImGUI
		imgui.Checkbox('Акцент', accent) -- Чекбокс с акцентом
		
		if accent.v then -- Проверка, если акцент включен
			imgui.InputText("Поле ввода акцента", text_accent) -- Добавляем поле ввода акцента
		end -- Конец проверки

	-- Кнопка
	if imgui.Button('Сохранить', imgui.ImVec2(135,25)) then -- Создаем кнопку
		mainIni.config.accent = accent.v -- Получаем чекбокс Акцента 
		mainIni.config.text_accent = text_accent.v -- Получаем поле с текстом Акцента
		inicfg.save(mainIni, 'Accent.ini') -- Сохраняем в файл
	end	
	-- Кнопка	

		imgui.End() -- Конец ImGUI
	end	-- Конец проверки
end -- Конец функции

function sampev.onSendChat(msg) -- Получаем сообщение чата
    return {u8:decode(text_accent.v) .. msg} -- Возвращаем сообщение чата + акцент
end -- Конец функции

function main() -- Начало основной функции
	if not isSampLoaded() or not isSampfuncsLoaded() then -- Проверка, если самп не активен
		return -- Возвращаем 
	end	-- Конец проверки
	-- Блок, который выполняеться 1 раз
	sampRegisterChatCommand("accent", cmd_accent) -- Ригстрация команды /accent в чат
	while true do -- начало цикла
		-- Бесконечный цикл
		wait(0) -- Задержка в 0 секунд
	end	-- Конец цикла 
end	-- Конец функции