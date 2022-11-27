
const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange','ce'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3, 10],
            backgroundColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255,1)',
                'rgba(255, 159, 64, 1)',
                'rgba(120, 255, 125, 1)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(120, 255, 125, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
    }
});

var count = 0;   	
var width = 0;							

var count1 = 0;   	
var width1 = 0;	

var count2 = 0;   	
var width2 = 0;	

function CountChecked(field){ 					
  if (field.checked) {						
    count += 1;								
  }
  else {										
    count -= 1;								
  }
  var width = count / 8.0 * 100;

  $('div').data('width',width);

  (function( $ ) {
    "use strict";

    $(function() {
      
        function animated_contents() {
          
            $(".zt-skill-bar > div ").each(function (i) {
                var $this  = $(this),





                    skills = $this.data('width');
  
                $this.css({'width' : skills + '%'});
  
            });
        }
        
        if(jQuery().appear) {
            $('.zt-skill-bar').appear().on('appear', function() {
                animated_contents();
            });
        } else {
            animated_contents();
        }
    });
  }(jQuery));


  document.getElementById('result').innerText
= width+'%';
}


function CountChecked1(field){ 					
  if (field.checked) {						
    count1 += 1;								
  }
  else {										
    count1 -= 1;								
  }
  var width1 = count1 / 8.0 * 100;

  $('div').data('width',width1);

  (function( $ ) {
    "use strict";

    $(function() {
      
        function animated_contents() {
          
            $(".zt-skill-bar1 > div ").each(function (i) {
                var $this  = $(this),
                    skills = $this.data('width');
  
                $this.css({'width' : skills + '%'});
  
            });
        }
        
        if(jQuery().appear) {
            $('.zt-skill-bar1').appear().on('appear', function() {
                animated_contents();
            });
        } else {
            animated_contents();
        }
    });
  }(jQuery));


  document.getElementById('result1').innerText
= width1+'%';
}


function CountChecked2(field){ 					
  if (field.checked) {						
    count2 += 1;								
  }
  else {										
    count2 -= 1;								
  }
  var width2 = count2 / 8.0 * 100;

  $('div').data('width',width2);

  (function( $ ) {
    "use strict";

    $(function() {
      
        function animated_contents() {
          
            $(".zt-skill-bar2 > div ").each(function (i) {
                var $this  = $(this),
                    skills = $this.data('width');
  
                $this.css({'width' : skills + '%'});
  
            });
        }
        
        if(jQuery().appear) {
            $('.zt-skill-bar2').appear().on('appear', function() {
                animated_contents();
            });
        } else {
            animated_contents();
        }
    });
  }(jQuery));


  document.getElementById('result2').innerText
= width2+'%';
}
