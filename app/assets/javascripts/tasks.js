// ページのloadが完了してからテーブルの色を変更する処理を開始する。
// window.onload = function() {
//   this.document.querySelectorAll('td').forEach(function(td) {
//     td.addEventListener('mouseover', function(e) {
//       e.currentTarget.style.backkgroundColor = '#eff';
//     });

//     td.addEventListener('mouseout', function(e) {
//       e.currentTarget.style.backgroundColor = '';
//     });
//   });
// };

// RailsはデフォルトでTurbolinksが有効なので、以下のような記述にする。
document.addEventListener("turbolinks:load", function() {
  // マウスがあるテーブルセルの色を変更
  document.querySelectorAll("td").forEach(function(td) {
    td.addEventListener("mouseover", function(e) {
      e.currentTarget.style.backgroundColor = "#eff";
    });

    td.addEventListener("mouseout", function(e) {
      e.currentTarget.style.backgroundColor = "";
    });
  });

  // 削除イベント処理で非表示にする。CSSのdeleteクラスが指定された削除ボタンの処理が成功した場合に非表示
  // 削除イベント時サーバから送られてくるレスポンスボディでの実装にするため、コメントアウト
  // document.querySelectorAll(".delete").forEach(function(a) {
  //   a.addEventListener("ajax:success", function() {
  //     var td = a.parentNode;
  //     var tr = td.parentNode;
  //     tr.style.display = "none";
  //   });
  // });
});
