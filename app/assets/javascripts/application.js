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
// While using GitBash for Windows, trying to start rails server. I was getting an execjs::runtime error >
// I removed > //= require_tree .    This fixed the issue temporarily. But then had missing assets error >
// That was looking for a helper.rb file...stackoverflow said it was a windows specific issue
// I put the require_tree back because that was bad practice. Found out execjs could not load the proper runtime
// I switched to command prompt and it wasn't working. Tried installing therubyracer because it was already in the gem file >
// Again, another error. Asking for Python2!?!?
// Instead, I installed node.js > Opened new command prompt, now functions as normal.

// original problem/answer > https://stackoverflow.com/questions/12520456/execjsruntimeerror-on-windows-trying-to-follow-rubytutorial

//= require turbolinks
//= require_tree 