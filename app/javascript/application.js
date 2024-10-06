// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import Cropper from 'cropperjs';
import 'cropperjs/dist/cropper.css';

const dropdownButton = document.getElementById('dropdown-button');
const dropdownMenu = document.getElementById('dropdown-menu');

dropdownButton.addEventListener('click', function(event) {
  event.stopPropagation(); // イベントが親要素にバブリングしないようにする
  dropdownMenu.classList.toggle('hidden'); // 'hidden' クラスのトグル
  dropdownMenu.style.right = '0';
});

// ドロップダウン外をクリックした場合、メニューを非表示にする
document.addEventListener('click', function() {
  dropdownMenu.classList.add('hidden'); // メニューを隠す
});

// ドロップダウンメニュー内をクリックした場合、メニューを保持
dropdownMenu.addEventListener('click', function(event) {
  event.stopPropagation(); // イベントが親要素にバブリングしないようにする
});
