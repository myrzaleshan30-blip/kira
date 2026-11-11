<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>kira.com — FTC для новичков</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Orbitron:wght@700;900&display=swap" rel="stylesheet">
<style>
:root{--bg:#050507;--card:#0d0d12;--text:#e6e3da;--muted:#9a978c;--gold:#f5d061;--gold2:#d4af37;--line:rgba(212,175,55,.22);--acc:#f5d061;box-sizing:border-box;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}
html{scroll-behavior:smooth;scroll-padding-top:env(safe-area-inset-top,0px)}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--text);font:16px/1.7 Inter,system-ui,sans-serif}
#stars{position:fixed;inset:0;width:100%;height:100%;z-index:0;pointer-events:none}
main{position:relative;z-index:1;max-width:860px;margin:0 auto;padding:0 20px 60px}
h1,h2,h3{font-family:Orbitron,Inter,sans-serif;line-height:1.25;margin:0}
.gold{background:linear-gradient(135deg,#fff0b3,#f5d061 50%,#d4af37);-webkit-background-clip:text;background-clip:text;color:transparent}
.hero{padding:28px 0 0;display:flex;flex-direction:column;align-items:center;text-align:center;gap:6px}
.logo-slot{width:min(460px,94vw)}.logo-slot img{mix-blend-mode:screen}
.logo-slot img,.logo-slot svg{width:100%;height:auto;display:block}
.from{font:700 12px Orbitron,sans-serif;letter-spacing:.5em;text-transform:uppercase;color:var(--gold);margin-top:-6px;padding-left:.5em}
.scroll{margin-top:48px;color:var(--muted);font-size:13px}
section{padding:48px 0}
h2{font-size:clamp(22px,4vw,30px);margin-bottom:18px;color:#fff}
p{margin:0 0 14px}
.lead{color:#cfccc0}
.grid{display:grid;gap:12px;margin-top:20px}
.mini{background:var(--card);border:1px solid var(--line);border-radius:14px;padding:14px 18px}
.mini b{color:var(--gold)}
.btns{display:flex;flex-wrap:wrap;gap:10px;margin:22px 0}
.btns button{font:600 14px Inter,sans-serif;color:var(--text);background:var(--card);border:1px solid var(--line);border-radius:999px;padding:11px 20px;cursor:pointer;transition:.2s}
.btns button:hover{border-color:var(--gold);color:var(--gold)}
.btns button.on{background:var(--gold);color:#111;border-color:var(--gold)}
#role{position:relative;overflow:hidden;border:1px solid var(--line);border-radius:22px;padding:30px 26px;background:var(--card);transition:background .6s,border-color .6s;min-height:300px}
#role canvas{position:absolute;inset:0;width:100%;height:100%;pointer-events:none;opacity:.55}
#role .in{position:relative}
#role h3{font-size:clamp(22px,4vw,28px);color:var(--acc);margin-bottom:6px;transition:color .4s}
.tag{color:var(--muted);font-size:14px;margin-bottom:22px}
#role h4{margin:24px 0 8px;font:700 13px Orbitron,sans-serif;letter-spacing:.12em;text-transform:uppercase;color:var(--acc)}
#role ul{margin:0;padding-left:20px}#role li{margin-bottom:6px}
.chips{display:flex;flex-wrap:wrap;gap:8px}
.chips span{border:1px solid var(--line);border-radius:8px;padding:3px 11px;font-size:13px;background:rgba(0,0,0,.45)}
.links a{display:block;color:var(--text);text-decoration:none;background:rgba(0,0,0,.5);border:1px solid var(--line);border-radius:12px;padding:12px 16px;margin-bottom:8px;transition:.2s}
.links a:hover{border-color:var(--acc)}
.links small{display:block;color:var(--muted)}
.fade{animation:f .5s ease}
@keyframes f{from{opacity:0;transform:translateY(8px)}to{opacity:1;transform:none}}
footer{text-align:center;color:var(--muted);font-size:13px;padding:30px 0 10px;border-top:1px solid var(--line)}
@media (prefers-reduced-motion:reduce){.fade{animation:none}}

.facts{display:grid;grid-template-columns:repeat(auto-fit,minmax(150px,1fr));gap:12px;margin:26px 0}
.facts div{background:var(--card);border:1px solid var(--line);border-radius:14px;padding:16px;text-align:center}
.facts b{display:block;font:800 22px Orbitron,sans-serif;color:var(--gold);margin-bottom:4px}
.facts span{font-size:13px;color:var(--muted);line-height:1.4;display:block}
.g{color:var(--gold)}
details{background:var(--card);border:1px solid var(--line);border-radius:14px;padding:14px 18px;margin:22px 0}
summary{cursor:pointer;font-weight:600;color:var(--gold)}
details p{margin:10px 0 0;font-size:15px}
.steps{padding-left:20px}.steps li{margin-bottom:12px}
.lablink{display:inline-block;color:#111;background:var(--acc);padding:9px 18px;border-radius:999px;font-weight:600;text-decoration:none}
section[hidden]{display:none}
.mon{border:1px solid var(--line);border-radius:18px;overflow:hidden;background:#07070a;box-shadow:0 0 40px rgba(212,175,55,.08)}
.mon .bar{display:flex;align-items:center;gap:7px;padding:10px 14px;background:#111118;border-bottom:1px solid var(--line);font:12px monospace;color:var(--muted)}
.mon .bar i{width:10px;height:10px;border-radius:50%;background:#3a3526;display:block}.mon .bar span{margin-left:8px}.mon .bar b{color:var(--gold)}
.mbody{display:grid;grid-template-columns:170px 1fr}
.parts{display:flex;flex-direction:column;gap:6px;padding:12px;border-right:1px solid var(--line);max-height:380px;overflow-y:auto}
.parts button{font:500 13px Inter,sans-serif;color:var(--text);background:transparent;border:1px solid var(--line);border-radius:8px;padding:8px 10px;text-align:left;cursor:pointer}
.parts button.on{background:var(--gold);color:#111;border-color:var(--gold)}
.scr{padding:12px;min-width:0}
#lc{width:100%;height:300px;display:block;background:#000;border-radius:10px}
.ctl{display:flex;flex-wrap:wrap;gap:12px;align-items:center;margin-top:10px;font-size:14px}.ctl b{color:var(--gold)}.ctl input{flex:1;min-width:140px;accent-color:#d4af37}
.info{padding:6px 18px 12px;border-top:1px solid var(--line);font-size:15px}.info .spec{color:var(--gold);font:12px monospace}
@media(max-width:620px){.mbody{grid-template-columns:1fr}.parts{flex-direction:row;overflow-x:auto;border-right:0;border-bottom:1px solid var(--line)}.parts button{white-space:nowrap}}
</style>
</head>
<body>
<canvas id="stars"></canvas>
<main>

<div class="hero">
    <div class="logo-slot"><img alt="KIRA" src="data:image/webp;base64,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"></div>
  <div class="from">from KIRA</div>
</div>

<section>
  <h2>Что такое <span class="gold">FTC</span></h2>
  <p class="lead">FIRST Tech Challenge — международные соревнования по робототехнике для школьников 12–18 лет (в США это 7–12 классы). Движение FIRST основал в 1989 году изобретатель Дин Кеймен, а идея простая: инженерия должна быть такой же азартной, как спорт.</p>
  <p>Каждую осень организаторы объявляют новую игру. Это называется Kickoff. На поле появляются задания: перенести элементы, собрать их в зонах, подняться в конце матча. За каждое действие дают очки. Дальше у команды несколько месяцев, чтобы придумать, спроектировать, собрать и запрограммировать робота, который лучше других справится с этой игрой.</p>
  <p>Играют не поодиночке: в матче две команды объединяются в альянс и соревнуются против другого альянса. Поэтому важно не только построить хорошего робота, но и договориться с партнёром, кто что делает на поле.</p>

  <div class="facts">
    <div><b>2:30</b><span>длится матч</span></div>
    <div><b>18″</b><span>куб, в который должен влезать робот (≈46 см)</span></div>
    <div><b>12×12 ft</b><span>поле, примерно 3,6×3,6 м</span></div>
    <div><b>до 15</b><span>участников в команде</span></div>
  </div>

  <h2 style="font-size:21px;margin-top:38px">Как проходит матч</h2>
  <p><b class="g">Автономка (30 секунд).</b> Робот едет сам, без водителей. Всё, что он делает, заранее прописано в программе. Здесь команды зарабатывают первые очки и показывают, насколько хорошо работает код.</p>
  <p><b class="g">TeleOp (2 минуты).</b> Теперь робота ведут два водителя с геймпадов. Нужно быстро собирать элементы и приносить их на нужные места, не мешая партнёру по альянсу.</p>
  <p><b class="g">Финал матча.</b> В конце обычно есть особое задание: подъём, парковка или что-то подобное. Игра каждый год разная, поэтому конструкции и стратегии не повторяются.</p>

  <h2 style="font-size:21px;margin-top:38px">Как выглядит день соревнований</h2>
  <p>Сначала проходят квалификационные матчи: каждая команда играет несколько раз с разными партнёрами. По результатам составляется таблица. Потом лучшие команды выбирают себе союзников для плей-офф, и тут уже решает не только сила робота, но и то, как о вас думают другие команды. Параллельно работают судьи: они ходят по питам, смотрят инженерную книгу и беседуют с участниками.</p>
  <p>Награды выдают не только за победу в матчах. Есть награды за дизайн, за управление роботом, за инновации, за работу с сообществом, и главная — <b class="g">Inspire Award</b>, которую получает команда, сильная во всём сразу.</p>

  <h2 style="font-size:21px;margin-top:38px">Из чего состоит робот</h2>
  <p>Мозг робота — Control Hub от REV: небольшая плата с процессором, к которой подключаются моторы, сервоприводы и датчики. Питается всё от 12-вольтового аккумулятора. Водители подключаются через Driver Station (телефон или Driver Hub) по Wi-Fi Direct. Программа пишется на Java и загружается на хаб прямо с компьютера. Детали покупают в наборах: чаще всего REV или goBILDA, а часть деталей печатают на 3D-принтере.</p>

  <h2 style="font-size:21px;margin-top:38px">Чем это полезно тебе</h2>
  <p>В FTC ты на практике делаешь то, что обычно учат уже в вузе: считаешь передаточные числа, читаешь чертежи, пишешь код для реального железа, ищешь баги, когда робот не едет прямо, и объясняешь свои решения взрослым судьям. Это хороший опыт для портфолио, а ещё место, где находят друзей, с которыми потом идут в инженерию или IT.</p>
  <p>У FIRST есть принцип <b class="g">Gracious Professionalism</b> — уважение и честная борьба. На турнире нормально одолжить сопернику запчасть или помочь починить робота прямо перед матчем. Это называют Coopertition: соревнуешься, но не воюешь.</p>

  <details><summary>Мини-словарь новичка</summary>
    <p><b class="g">Alliance</b> — пара команд, играющих вместе в одном матче.</p>
    <p><b class="g">Autonomous / TeleOp</b> — режим без водителей и режим с водителями.</p>
    <p><b class="g">Control Hub</b> — главный контроллер робота.</p>
    <p><b class="g">Driver Station</b> — устройство, с которого водители управляют роботом.</p>
    <p><b class="g">Engineering Notebook / Portfolio</b> — отчёт команды о том, как она проектировала и строила робота.</p>
    <p><b class="g">Pit</b> — место команды на турнире, где ремонтируют робота и общаются с судьями.</p>
    <p><b class="g">Scrimmage</b> — тренировочный турнир без серьёзных последствий.</p>
  </details>

  <h2 style="font-size:21px;margin-top:38px">Как команда живёт в течение сезона</h2>
  <ol class="steps">
    <li><b>Осень.</b> Kickoff, разбор правил, первые идеи и прототипы. Здесь лучше потратить время на понимание игры, чем сразу собирать робота.</li>
    <li><b>Осень – зима.</b> Сборка основного робота, программирование автономки, первые тренировочные матчи и турниры.</li>
    <li><b>Зима.</b> Доработка, ремонт слабых мест, оформление инженерной книги, подготовка к судейским интервью.</li>
    <li><b>Весна.</b> Региональные и национальные чемпионаты, а для лучших команд — выход на международный уровень.</li>
  </ol>
</section>

<section>
  <h2>Кто есть кто в <span class="gold">команде</span></h2>
  <p class="lead">Робот — не работа одного человека. Ниже пять основных направлений. Одна роль не мешает пробовать другие: в маленьких командах многие делают сразу два-три дела.</p>
  <div class="grid">
    <div class="mini"><b>Coder</b> — пишет программу, по которой робот едет сам и слушается геймпадов. Любит логику, пробует, ломает, чинит. Если тебе нравится видеть, как строчки кода превращаются в движение, тебе сюда.</div>
    <div class="mini"><b>Hardware / Builder</b> — собирает механику: шасси, захваты, подъёмники. Нужен тем, кто любит что-то делать руками и разбираться, почему оно не работает.</div>
    <div class="mini"><b>3D CAD Designer</b> — рисует робота в компьютере, пока он ещё не собран, и печатает кастомные детали. Подойдёт тем, кому нравится аккуратность и пространственное мышление.</div>
    <div class="mini"><b>Inspire &amp; Outreach</b> — ведёт инженерную книгу, ищет спонсоров, рассказывает о команде школам и судьям. Для тех, кто умеет писать, говорить и организовывать.</div>
    <div class="mini"><b>Captain / Management</b> — держит план, дедлайны и настроение. Не обязательно самый сильный технарь, но человек, к которому приходят с вопросами.</div>
  </div>
  <p style="margin-top:18px;color:var(--muted)">Не знаешь, что выбрать? Прочитай все роли ниже: у каждой есть список того, с чего начать, и частые ошибки.</p>
</section>

<section>
  <h2>Выбери <span class="gold">свою роль</span></h2>
  <p>Нажми на кнопку и посмотри, как выглядит работа изнутри.</p>
  <div class="btns" id="btns"></div>
  <div id="role"><canvas id="rc"></canvas><div class="in" id="rin"><p style="color:var(--muted)">Здесь появится описание роли. Выбери любую кнопку выше ↑</p></div></div>
</section>

<section id="lab" hidden>
  <h2>Лаборатория: <span class="gold">детали робота</span></h2>
  <p>Выбери деталь слева и поиграй ползунком. Это маленькая демонстрация, которая показывает, как деталь работает внутри робота.</p>
  <div class="mon">
    <div class="bar"><i></i><i></i><i></i><span>KIRA LAB · <b id="lname"></b></span></div>
    <div class="mbody">
      <div class="parts" id="parts"></div>
      <div class="scr">
        <canvas id="lc"></canvas>
        <div class="ctl"><label id="llab"></label><input type="range" id="ls" min="0" max="100" value="50" aria-label="Параметр"></div>
      </div>
    </div>
    <div class="info" id="linfo"></div>
  </div>
</section>

<footer>kira.com · Сделано командой KIRA для тех, кто только начинает</footer>
</main>

<script>
/* звёзды на фоне */
var sc=document.getElementById('stars'),sx=sc.getContext('2d'),st=[];
function rs(){sc.width=innerWidth;sc.height=innerHeight;st=[];for(var i=0;i<90;i++)st.push({x:Math.random()*sc.width,y:Math.random()*sc.height,r:Math.random()*1.2+.3,p:Math.random()*6,s:Math.random()*.02+.005})}
function ds(){sx.clearRect(0,0,sc.width,sc.height);st.forEach(function(s){s.p+=s.s;sx.globalAlpha=.25+.5*Math.abs(Math.sin(s.p));sx.fillStyle='#f5d061';sx.beginPath();sx.arc(s.x,s.y,s.r,0,6.3);sx.fill()});requestAnimationFrame(ds)}
addEventListener('resize',rs);rs();ds();

/* данные ролей */
var R={
coder:{n:'Coder',t:'Программист',sub:'Пишет «мозги» робота',acc:'#5df08a',bg:'linear-gradient(160deg,#04130a,#0d0d12)',
 did:['Пишешь автономку: робот сам едет, берёт элементы и паркуется за 30 секунд.','Настраиваешь управление с геймпадов для TeleOp, чтобы водителю было удобно.','Подключаешь датчики: гироскоп, энкодеры, камеру. Они нужны, чтобы робот понимал, где он.','Позже — одометрия и компьютерное зрение (AprilTag), чтобы робот ездил точно.'],
 why:'Можно собрать идеальную механику, но без программы робот просто стоит. Ошибка в коде — и вся автономка идёт мимо очков.',
 learn:['Java','Android Studio','Git / GitHub','FTC SDK','Road Runner','FTC Dashboard'],
 how:'Начни с обычной Java: переменные, условия, циклы, классы. Потом открой FTC SDK и запусти первую программу, которая крутит один мотор.',
 links:[['Официальная документация FTC','https://ftc-docs.firstinspires.org/','Установка, первые программы, справочник'],['Game Manual 0','https://gm0.org/','Большой разбор программирования и механики от сообщества'],['Learn Road Runner','https://learnroadrunner.com/','Пошаговая настройка точного движения']]},
engineer:{n:'Hardware / Builder',t:'Инженер-механик',sub:'Делает так, чтобы робот ехал, хватал и поднимал',acc:'#6db6ff',bg:'linear-gradient(160deg,#050c18,#0d0d12)',
 did:['Собираешь шасси (чаще всего Mecanum, чтобы ехать в любую сторону).','Делаешь захват и подъёмник под задачи сезона.','Считаешь передаточные числа: ремни, шестерни, цепи.','Аккуратно прокладываешь провода и крепишь Control Hub и аккумулятор.'],
 why:'Матчей за день бывает много. Если провод выпал или винт раскрутился, команда вылетает из борьбы. Прочный и аккуратный робот выигрывает чаще.',
 learn:['Механика','REV / goBILDA','Передачи','Кабель-менеджмент','Ремонт на ходу'],
 how:'Для начала собери простое шасси по инструкции, потом попробуй переделать его под себя. Ниже можно посмотреть, как работают главные детали.',
 links:[['Game Manual 0 — механика','https://gm0.org/','Всё про шасси, захваты и подъёмники'],['Документация REV Robotics','https://docs.revrobotics.com/','Моторы, хабы, подключение'],['goBILDA — обучающие материалы','https://www.gobilda.com/','Каталог деталей и гайды по сборке']],viz:1},
cad:{n:'3D CAD Designer',t:'3D-конструктор',sub:'Строит робота в компьютере до сборки',acc:'#c58bff',bg:'linear-gradient(160deg,#0e0818,#0d0d12)',
 did:['Моделируешь весь робот по узлам в Onshape.','Рисуешь детали для 3D-печати: крепления, держатели.','Проверяешь, что робот влезает в 18×18×18 дюймов, ещё до сборки.','Делаешь картинки для инженерной книги и спонсоров.'],
 why:'Ошибку в чертеже поправить за минуту. Ошибку в металле — это потерянные дни и деньги. CAD даёт команде возможность подумать, прежде чем резать.',
 learn:['Onshape','Сборки (Assemblies)','3D-печать','Допуски и размеры','Рендеры'],
 how:'Onshape работает в браузере и бесплатен для учащихся. Пройди базовый курс, потом смоделируй один узел, например захват.',
 links:[['Onshape Learning Center','https://learn.onshape.com/','Бесплатные курсы от создателей'],['Game Manual 0 — CAD','https://gm0.org/','Советы по проектированию под FTC'],['Документация FTC','https://ftc-docs.firstinspires.org/','Правила и размеры робота']]},
inspire:{n:'Inspire & Outreach',t:'Инженерная книга и связи',sub:'Рассказывает, зачем команда существует',acc:'#ff9ad5',bg:'linear-gradient(160deg,#180a14,#0d0d12)',
 did:['Ведёшь инженерную книгу: решения, ошибки, эксперименты, фото.','Организуешь мастер-классы и показываешь STEM другим школьникам.','Ищешь спонсоров и ведёшь соцсети.','Готовишь команду к разговору с судьями.'],
 why:'Главная награда FTC — Inspire Award — достаётся не самому быстрому роботу, а самой цельной команде. Судьи оценивают книгу и интервью не меньше, чем матчи.',
 learn:['Письменная речь','Презентации','Фото и дизайн','Общение со спонсорами','Публичные выступления'],
 how:'Начни с привычки: после каждой тренировки записывай, что сделали и почему. Через месяц у тебя будет основа книги.',
 links:[['FTC — раздел наград и судейства','https://www.firstinspires.org/robotics/ftc','Что именно оценивают судьи'],['Документация FTC','https://ftc-docs.firstinspires.org/','Правила и материалы для команд']]},
captain:{n:'Captain / Management',t:'Капитан',sub:'Собирает всех в одну команду',acc:'#f5d061',bg:'linear-gradient(160deg,#18130a,#0d0d12)',
 did:['Распределяешь задачи и следишь за сроками до турнира.','Придумываешь стратегию на матчи и общаешься с партнёрами по альянсу.','Решаешь организационные вопросы с оргкомитетом.','Поддерживаешь порядок в мастерской и настроение людей.'],
 why:'Можно иметь трёх гениев в команде и всё равно опоздать на турнир. Капитан делает так, чтобы работа шла вовремя и никто не выгорал.',
 learn:['Планирование','Коммуникация','Стратегия матчей','Лидерство','Работа с конфликтами'],
 how:'Попробуй вести общий список задач с датами и раз в неделю обсуждать, что сделано. Это уже половина работы капитана.',
 links:[['Документация FTC','https://ftc-docs.firstinspires.org/','Правила, расписание сезона'],['Game Manual 0','https://gm0.org/','Раздел про организацию команды']]}
};


var X={
coder:{steps:['Установи Android Studio и скачай FTC SDK по официальной инструкции.','Подключись к Control Hub и запусти пример, который крутит один мотор.','Напиши простую автономку: проехать вперёд и остановиться.','Подключи гироскоп (IMU) и научи робота поворачиваться на точный угол.','Только потом берись за одометрию и камеру.'],err:['Писать огромную программу сразу вместо небольших проверяемых кусков.','Не пользоваться Git: потом никто не знает, какая версия работала.','Не тестировать на заряженном аккумуляторе: на разном заряде робот едет по-разному.','Забывать про безопасность: сначала поставь робота на подставку, потом тестируй моторы.']},
engineer:{steps:['Прочитай, из чего состоит базовое шасси, и собери его по инструкции.','Изучи типы приводов: Mecanum, tank, swerve — и пойми, чем они отличаются.','Построй прототип захвата из картона и скотча до того, как что-то резать.','Научись считать передаточные числа: от этого зависят скорость и сила.','Следи, чтобы провода не касались движущихся частей, и закрепляй их стяжками.'],err:['Строить красивый, но слишком тяжёлый механизм.','Недотягивать винты: на вибрации они откручиваются.','Не оставлять место для ремонта: «потом разберём» может не получиться.','Игнорировать центр тяжести: высокий робот легко переворачивается.']},
cad:{steps:['Зарегистрируйся в Onshape (для учащихся бесплатно) и пройди базовый курс.','Научись делать эскиз, выдавливание и сборку из нескольких деталей.','Смоделируй один простой узел, например колесо с креплением.','Собери целого робота из деталей REV или goBILDA и проверь размеры.','Подготовь файл для 3D-печати и распечатай пробную деталь.'],err:['Не задавать размеры: потом деталь не подходит на 0,5 мм.','Рисовать всё в одном эскизе: потом ничего не поправить.','Не проверять допуски печати: отверстия получаются меньше.','Не делить модель на сборки: файл становится неуправляемым.']},
inspire:{steps:['Заведи общий документ или тетрадь для записи всего, что делает команда.','После каждой тренировки пиши: что делали, что не получилось, что решили.','Фотографируй чертежи, прототипы и испытания: к книге пригодится.','Придумай мероприятие для школьников: мастер-класс, показ робота, день открытых дверей.','Потренируй команду отвечать судьям: коротко, по делу, с примерами.'],err:['Оформлять книгу за неделю до турнира.','Писать красиво, но без фактов о том, что сделали.','Не показывать неудачи: судьи ценят, как команда на них реагирует.','Делать всё одному: судьям интересна вся команда.']},
captain:{steps:['Создай общий план с датами: Kickoff, тренировки, турниры.','Раздай задачи и сроки, а потом раз в неделю собирай всех на короткую встречу.','Договорись о правилах: когда начинаем, кто отвечает за инструменты, как решаем споры.','Изучи правила игры и придумай стратегию для разных партнёров.','Не забывай про отдых и благодарность: команда держится на настроении.'],err:['Делать всё самому вместо того, чтобы распределять задачи.','Ставить нереальные сроки и потом срывать их.','Не слушать мнение новичков.','Откладывать конфликты: они сами не исчезают.']}
};
function ext(k){var x=X[k];return '<h4>С чего начать</h4><ol class="steps">'+x.steps.map(function(a){return'<li>'+a+'</li>'}).join('')+'</ol><h4>Частые ошибки новичков</h4><ul>'+x.err.map(function(a){return'<li>'+a+'</li>'}).join('')+'</ul>'}
var bx=document.getElementById('btns');
Object.keys(R).forEach(function(k){var b=document.createElement('button');b.textContent=R[k].n;b.id='b-'+k;b.onclick=function(){pick(k)};bx.appendChild(b)});

var rc=document.getElementById('rc'),rx=rc.getContext('2d'),mode='',anim=0,tt=0;
function pick(k){
  var d=R[k];
  document.querySelectorAll('.btns button').forEach(function(b){b.classList.remove('on')});
  document.getElementById('b-'+k).classList.add('on');
  var el=document.getElementById('role');
  el.style.background=d.bg;el.style.borderColor=d.acc+'66';el.style.setProperty('--acc',d.acc);
  var h='<div class="fade"><h3>'+d.t+'</h3><div class="tag">'+d.sub+'</div>'
   +'<h4>Что ты будешь делать</h4><ul>'+d.did.map(function(x){return'<li>'+x+'</li>'}).join('')+'</ul>'
   +'<h4>Почему это важно</h4><p>'+d.why+'</p>'
   +'<h4>Чему нужно научиться</h4><div class="chips">'+d.learn.map(function(x){return'<span>'+x+'</span>'}).join('')+'</div><p style="margin-top:12px">'+d.how+'</p>'
   +(d.viz?'<p><a class="lablink" href="#lab">Открыть лабораторию деталей ↓</a></p>':'')+ext(k)
   +'<h4>Проверенные материалы</h4><div class="links">'+d.links.map(function(l){return'<a href="'+l[1]+'" target="_blank" rel="noopener">'+l[0]+'<small>'+l[2]+'</small></a>'}).join('')+'</div></div>';
  document.getElementById('rin').innerHTML=h;
  mode=k;sizeBg();
  showLab(!!d.viz);
}
function sizeBg(){rc.width=rc.parentElement.clientWidth;rc.height=rc.parentElement.clientHeight}
addEventListener('resize',sizeBg);

/* фон роли */
var cols=[];
function bgLoop(){
  rx.clearRect(0,0,rc.width,rc.height);tt+=.02;var a=R[mode]?R[mode].acc:'#f5d061';rx.fillStyle=rx.strokeStyle=a;
  if(mode==='coder'){
    rx.font='13px monospace';var w=['public','void','int','if','{','}','motor','0x1F','while','=>','Math','true'];
    for(var i=0;i<rc.width/18;i++){if(cols[i]===undefined)cols[i]=Math.random()*rc.height;cols[i]+=1+(i%4);if(cols[i]>rc.height+20)cols[i]=-20;rx.globalAlpha=.35;rx.fillText(w[i%w.length],i*18,cols[i])}
  }else if(mode==='engineer'){
    rx.globalAlpha=.18;rx.lineWidth=1;for(var x=0;x<rc.width;x+=32){rx.beginPath();rx.moveTo(x,0);rx.lineTo(x,rc.height);rx.stroke()}for(var y=0;y<rc.height;y+=32){rx.beginPath();rx.moveTo(0,y);rx.lineTo(rc.width,y);rx.stroke()}
    gear(rc.width-90,90,45,tt);gear(rc.width-165,128,30,-tt*1.5)
  }else if(mode==='cad'){
    rx.globalAlpha=.4;rx.lineWidth=1.5;var cx=rc.width-110,cy=110,s=55,P=[];
    for(var i=0;i<8;i++){var X=(i&1?1:-1),Y=(i&2?1:-1),Z=(i&4?1:-1),c=Math.cos(tt),n=Math.sin(tt);var x1=X*c-Z*n,z1=X*n+Z*c,c2=Math.cos(.6),n2=Math.sin(.6);P.push([cx+x1*s,cy+(Y*c2-z1*n2)*s])}
    [[0,1],[2,3],[4,5],[6,7],[0,2],[1,3],[4,6],[5,7],[0,4],[1,5],[2,6],[3,7]].forEach(function(e){rx.beginPath();rx.moveTo(P[e[0]][0],P[e[0]][1]);rx.lineTo(P[e[1]][0],P[e[1]][1]);rx.stroke()})
  }else if(mode==='inspire'){
    for(var i=0;i<14;i++){var px=(i*97)%rc.width,py=(i*61+tt*20*(1+i%3))%rc.height;rx.globalAlpha=.3+.3*Math.sin(tt*2+i);rx.beginPath();rx.moveTo(px,py-7);rx.lineTo(px+2,py-2);rx.lineTo(px+7,py);rx.lineTo(px+2,py+2);rx.lineTo(px,py+7);rx.lineTo(px-2,py+2);rx.lineTo(px-7,py);rx.lineTo(px-2,py-2);rx.fill()}
  }else if(mode==='captain'){
    rx.globalAlpha=.25;rx.lineWidth=1.5;for(var i=1;i<5;i++){rx.beginPath();rx.ellipse(rc.width-120,110,i*28,i*11,tt*.3+i*.2,0,6.3);rx.stroke()}
  }
  rx.globalAlpha=1;anim=requestAnimationFrame(bgLoop)
}
function gear(cx,cy,r,a){rx.lineWidth=2;rx.beginPath();for(var i=0;i<12;i++){var t1=a+i*Math.PI/6,t2=t1+Math.PI/12;rx.lineTo(cx+Math.cos(t1)*r,cy+Math.sin(t1)*r);rx.lineTo(cx+Math.cos(t1+.1)*(r+8),cy+Math.sin(t1+.1)*(r+8));rx.lineTo(cx+Math.cos(t2)*(r+8),cy+Math.sin(t2)*(r+8));rx.lineTo(cx+Math.cos(t2+.1)*r,cy+Math.sin(t2+.1)*r)}rx.closePath();rx.stroke()}
bgLoop();

/* лаборатория деталей (инженер) */
var lc=document.getElementById('lc'),lx=lc.getContext('2d'),lk='motor',lv=50,la=0,labOn=false;
function gr(c,x,y,r,n,a){c.beginPath();var s=Math.PI*2/n;for(var i=0;i<n;i++){var t=a+i*s;c.lineTo(x+Math.cos(t)*(r-6),y+Math.sin(t)*(r-6));c.lineTo(x+Math.cos(t+s*.15)*(r+6),y+Math.sin(t+s*.15)*(r+6));c.lineTo(x+Math.cos(t+s*.5)*(r+6),y+Math.sin(t+s*.5)*(r+6));c.lineTo(x+Math.cos(t+s*.65)*(r-6),y+Math.sin(t+s*.65)*(r-6))}c.closePath();c.fill();c.stroke();c.beginPath();c.arc(x,y,6,0,6.3);c.fillStyle='#000';c.fill()}
function arrow(c,x,y,dx,dy){c.strokeStyle=c.fillStyle='#6db6ff';c.lineWidth=4;c.beginPath();c.moveTo(x,y);c.lineTo(x+dx,y+dy);c.stroke();c.beginPath();c.arc(x+dx,y+dy,6,0,6.3);c.fill()}
var P={
motor:{n:'Мотор',lab:'Мощность',f:function(v){return v+'%'},txt:'Электромотор с редуктором. Он крутит колёса, подъёмники и вращающиеся механизмы. Внутри стоит энкодер, который считает обороты, поэтому программа знает, сколько проехал робот.',spec:'12 В · редуктор · энкодер',
 d:function(c,w,h,v){c.fillStyle='#17171f';c.strokeStyle='#d4af37';c.lineWidth=3;c.beginPath();c.roundRect(w/2-140,h/2-50,190,100,12);c.fill();c.stroke();c.fillStyle='#d4af37';c.fillRect(w/2+50,h/2-6,30,12);c.save();c.translate(w/2+95,h/2);c.rotate(la);c.fillStyle='#f5d061';c.beginPath();c.arc(0,0,30,0,6.3);c.fill();c.fillStyle='#000';c.fillRect(-4,-28,8,14);c.restore();c.strokeStyle='#8a6d10';c.beginPath();c.moveTo(w/2-140,h/2-20);c.bezierCurveTo(w/2-190,h/2-20,w/2-190,h/2+40,w/2-230,h/2+40);c.stroke()}},
mec:{n:'Колесо Mecanum',lab:'Мощность',f:function(v){return v+'%'},txt:'Ролики стоят под 45°. Если четыре таких колеса крутить в разных сочетаниях, робот поедет вбок или по диагонали, не поворачиваясь. Синяя стрелка показывает, куда толкает колесо.',spec:'ролики 45° · круговое движение',
 d:function(c,w,h,v){c.save();c.translate(w/2,h/2);c.rotate(la);c.fillStyle='#17171f';c.strokeStyle='#f5d061';c.lineWidth=4;c.beginPath();c.arc(0,0,90,0,6.3);c.fill();c.stroke();for(var i=0;i<10;i++){var a=i*Math.PI/5;c.save();c.translate(Math.cos(a)*72,Math.sin(a)*72);c.rotate(a+Math.PI/4);c.fillStyle='#d4af37';c.fillRect(-8,-18,16,36);c.restore()}c.restore();if(v>5)arrow(c,w/2,h/2,v*1.1,-v*1.1)}},
servo:{n:'Сервопривод',lab:'Угол',f:function(v){return Math.round(v*2.7)+'°'},txt:'Поворачивает рычаг на заданный угол и держит его. Так работают захваты, «запястья» и затворы. В отличие от мотора, он не вращается бесконечно, а едет в нужную точку.',spec:'до ~270° · точное позиционирование',
 d:function(c,w,h,v){var a=(v*2.7-135)*Math.PI/180;c.fillStyle='#17171f';c.strokeStyle='#d4af37';c.lineWidth=3;c.beginPath();c.roundRect(w/2-70,h/2-60,140,120,12);c.fill();c.stroke();c.save();c.translate(w/2,h/2-8);c.rotate(a);c.fillStyle='#f5d061';c.beginPath();c.roundRect(-12,-85,24,100,8);c.fill();c.fillStyle='#000';c.beginPath();c.arc(0,-65,5,0,6.3);c.arc(0,-42,5,0,6.3);c.fill();c.restore()}},
gears:{n:'Шестерни',lab:'Скорость',f:function(v){return v+'%'},txt:'Две шестерни разного размера: маленькая (12 зубьев) вращает большую (24). Получается передача 2:1. Скорость падает вдвое, а сила (момент) вдвое растёт. Так робот поднимает тяжёлые вещи.',spec:'передаточное число 2:1',
 d:function(c,w,h,v){c.fillStyle='#d4af37';c.strokeStyle='#f5d061';c.lineWidth=2;gr(c,w/2-75,h/2,45,12,la*2);gr(c,w/2+25,h/2,90,24,-la+Math.PI/24);c.fillStyle='#f5d061';c.font='13px Inter';c.fillText('12 зубьев',w/2-112,h/2+85);c.fillText('24 зуба',w/2+5,h/2+135)}},
belt:{n:'Ремень и шкивы',lab:'Скорость',f:function(v){return v+'%'},txt:'Шкивы с зубчатым ремнём передают вращение на расстояние и работают тише цепи. Ремень не любит перекоса: если шкивы стоят не в одной плоскости, он слетает.',spec:'ремень GT2 · бесшумно · для лёгких нагрузок',
 d:function(c,w,h,v){var x1=w/2-110,x2=w/2+110,r1=38,r2=66,y=h/2;c.strokeStyle='#8a6d10';c.lineWidth=8;c.setLineDash([10,8]);c.lineDashOffset=-la*40;c.beginPath();c.moveTo(x1,y-r1);c.lineTo(x2,y-r2);c.moveTo(x1,y+r1);c.lineTo(x2,y+r2);c.stroke();c.setLineDash([]);c.fillStyle='#17171f';c.strokeStyle='#f5d061';c.lineWidth=3;c.beginPath();c.arc(x1,y,r1,0,6.3);c.fill();c.stroke();c.beginPath();c.arc(x2,y,r2,0,6.3);c.fill();c.stroke();c.fillStyle='#f5d061';c.save();c.translate(x1,y);c.rotate(la*1.7);c.fillRect(-r1+8,-3,2*r1-16,6);c.restore();c.save();c.translate(x2,y);c.rotate(la);c.fillRect(-r2+8,-3,2*r2-16,6);c.restore()}},
slides:{n:'Линейный подъёмник',lab:'Высота',f:function(v){return v+'%'},txt:'Телескопические направляющие выдвигаются секциями, одна из другой. Так робот достаёт до верхних зон поля, а в сложенном виде укладывается в 18 дюймов. Секции двигает шнур или ремень.',spec:'3 секции · выдвигается в 2–3 раза',
 d:function(c,w,h,v){var b=h-30,x=w/2,k=v/100;c.fillStyle='#17171f';c.strokeStyle='#d4af37';c.lineWidth=3;var hs=[200,200,200],ys=[0,k*150,k*300];for(var i=0;i<3;i++){c.fillStyle=i==2?'#2a2412':'#17171f';c.beginPath();c.rect(x-60+i*14,b-hs[i]*.55-ys[i]*.55,120-i*28,hs[i]*.55);c.fill();c.stroke()}c.fillStyle='#f5d061';c.fillRect(x-30,b-110-k*165-8,60,12);c.fillStyle='#d4af37';c.fillRect(x-90,b,180,14)}},
intake:{n:'Захват-интейк',lab:'Скорость',f:function(v){return v+'%'},txt:'Два вращающихся ролика втягивают элемент внутрь. Резиновые ролики цепляют предмет, а скорость подбирают так, чтобы не сломать и не выплюнуть его обратно.',spec:'ролики · мягкая резина · мотор или сервопривод',
 d:function(c,w,h,v){var y=h/2-30;c.strokeStyle='#d4af37';c.fillStyle='#17171f';c.lineWidth=3;[-1,1].forEach(function(s){c.beginPath();c.arc(w/2+s*55,y,42,0,6.3);c.fill();c.stroke();c.save();c.translate(w/2+s*55,y);c.rotate(-s*la*1.5);c.strokeStyle='#f5d061';for(var i=0;i<6;i++){c.rotate(Math.PI/3);c.beginPath();c.moveTo(14,0);c.lineTo(38,0);c.stroke()}c.restore()});var by=v>3?h-40-((la*35)%(h-40-y+10)):h-40;c.fillStyle='#f5d061';c.beginPath();c.arc(w/2,Math.max(by,y),30,0,6.3);c.fill();c.fillStyle='#000';c.font='11px Inter';c.fillText('элемент',w/2-22,Math.max(by,y)+4)}},
encoder:{n:'Энкодер',lab:'Скорость',f:function(v){return v+'%'},txt:'Диск с прорезями крутится рядом с датчиком. Каждый проход прорези — один «тик». По числу тиков программа знает, на сколько повернулся вал, и вычисляет, сколько проехал робот.',spec:'тики · точность хода · основа одометрии',
 d:function(c,w,h,v){var n=24,cx=w/2,cy=h/2+10;c.save();c.translate(cx,cy);c.rotate(la);c.fillStyle='#17171f';c.strokeStyle='#f5d061';c.lineWidth=3;c.beginPath();c.arc(0,0,85,0,6.3);c.fill();c.stroke();c.fillStyle='#000';for(var i=0;i<n;i++){c.save();c.rotate(i*Math.PI*2/n);c.fillRect(-4,-76,8,22);c.restore()}c.restore();c.fillStyle='#6db6ff';c.fillRect(cx-14,cy-110,28,26);c.font='13px monospace';c.fillStyle='#f5d061';c.fillText('тики: '+Math.floor(la/(Math.PI*2/n)),cx-95,cy+112)}},
hub:{n:'Control Hub',lab:'Заряд аккумулятора',f:function(v){return (10.5+v*.03).toFixed(1)+' В'},txt:'Главный контроллер робота. К нему подключают моторы, сервоприводы и датчики. Следи за напряжением: при просадке ниже ~11,5 В робот начинает вести себя странно, поэтому перед матчем меняют аккумулятор.',spec:'порты моторов · сервы · I²C · USB',
 d:function(c,w,h,v){var x=w/2-150,y=h/2-65;c.fillStyle='#17171f';c.strokeStyle='#d4af37';c.lineWidth=3;c.beginPath();c.roundRect(x,y,300,130,10);c.fill();c.stroke();c.font='11px monospace';c.fillStyle='#f5d061';for(var i=0;i<4;i++){c.fillRect(x+20+i*34,y+18,26,18);c.fillText('M'+i,x+22+i*34,y+54)}for(var j=0;j<6;j++){c.fillStyle='#8a6d10';c.fillRect(x+20+j*22,y+75,16,12);c.fillStyle='#f5d061';c.fillText('S'+j,x+20+j*22,y+102)}var low=10.5+v*.03<11.5,on=Math.sin(la*3)>-.3;c.fillStyle=low?(on?'#ff4d4d':'#401010'):(on?'#5df08a':'#103a1e');c.beginPath();c.arc(x+265,y+30,8,0,6.3);c.fill();c.fillStyle='#9a978c';c.fillText(low?'мало':'ok',x+250,y+56)}}
};
function lsize(){lc.width=lc.clientWidth;lc.height=300}
function lpick(k){lk=k;document.querySelectorAll('#parts button').forEach(function(b){b.classList.toggle('on',b.dataset.k===k)});var p=P[k];document.getElementById('lname').textContent=p.n;document.getElementById('linfo').innerHTML='<p>'+p.txt+'</p><p class="spec">'+p.spec+'</p>';lupd()}
function lupd(){var p=P[lk];document.getElementById('llab').innerHTML=p.lab+': <b>'+p.f(lv)+'</b>'}
Object.keys(P).forEach(function(k){var b=document.createElement('button');b.textContent=P[k].n;b.dataset.k=k;b.onclick=function(){lpick(k)};document.getElementById('parts').appendChild(b)});
document.getElementById('ls').oninput=function(){lv=+this.value;lupd()};
function ldraw(){if(labOn&&lc.clientWidth){if(lc.width!==lc.clientWidth)lsize();lx.clearRect(0,0,lc.width,lc.height);if(lk!=='slides'&&lk!=='servo'&&lk!=='hub'||lk==='hub')la+=lv/100*.1;P[lk].d(lx,lc.width,lc.height,lv)}requestAnimationFrame(ldraw)}
function showLab(on){var s=document.getElementById('lab');s.hidden=!on;labOn=on;if(on){lsize();lpick(lk)}}
ldraw();
</script>
</body>
</html>
