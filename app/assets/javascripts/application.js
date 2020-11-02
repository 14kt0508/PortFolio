// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require fullcalendar/locale-all
//= require_tree .

$(document).on('turbolinks:load', function () {
    // 画面遷移を検知
    if ($('#calendar').length) {
        console.log($('#calendar').length)

        function Calendar() {
            //return $('#calendar').fullCalendar({});
            return $('#calendar').fullCalendar({
                events: '/events.json',
                // events: [
                //     {
                //         "id":"1",
                //         "title":"タイトル",
                //         "description":"説明",
                //         "start": new Date('2020-10-25'),
                //         "end":new Date('2020-10-25'),
                //         "url":"some_address"
                //     }
                // ],
                //カレンダー上部を年月で表示させる
                titleFormat: 'YYYY年 M月',
                //曜日を日本語表示
                dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
                //ボタンのレイアウト
                header: {
                    left: '',
                    center: 'title',
                    right: 'today prev,next'
                },
                //終了時刻がないイベントの表示間隔
                defaultTimedEventDuration: '03:00:00',
                buttonText: {
                    prev: '前',
                    next: '次',
                    prevYear: '前年',
                    nextYear: '翌年',
                    today: '今日',
                    month: '月',
                    week: '週',
                    day: '日'
                },
                // Drag & Drop & Resize
                editable: true,
                //イベントの時間表示を２４時間に
                timeFormat: "HH:mm",
                //イベントの色を変える
                eventColor: '#87cefa',
                //イベントの文字色を変える
                eventTextColor: '#000000',
                eventRender: function(event, element) {
                    element.css("font-size", "0.8em");
                    element.css("padding", "5px");
                },
                eventClick: function(event, jsEvent, view) {
                //クリックしたイベントのタイトルが取れるよ
                //本番はURl変更必要
                location.href=`http://localhost:3000/admins/events/${event.id}`;
              }
            });
        }
        function clearCalendar() {
            $('#calendar').html('');
        }
        console.log(11)
        Calendar();
        $(document).on('turbolinks:before-cache', clearCalendar);

        //events: '/events.json', 以下に追加

    }
});