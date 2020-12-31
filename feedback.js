
    /* global Chart */
function load()
{
var a=[];
var myTab = document.getElementById('tab');
var k=1;
        // LOOP THROUGH EACH ROW OF THE TABLE AFTER .
        for (i = 1; i < myTab.rows.length; i++) {

            // GET THE CELLS COLLECTION OF THE CURRENT ROW.
            var objCells = myTab.rows.item(i).cells;

            // LOOP THROUGH EACH CELL OF THE CURENT ROW TO READ CELL VALUES.
            for (var j = 1; j < objCells.length; j++) {
                a[k]=objCells.item(j).innerHTML;
                    k++;
        }
                 // ADD A BREAK (TAG).
            }
            alert("dispalying feedbacks");
            
    
    //service
 
    
let myChart = document.getElementById('myChart').getContext('2d');

    // Global Options
    Chart.defaults.global.defaultFontFamily = 'Lato';
    Chart.defaults.global.defaultFontSize = 18;
    Chart.defaults.global.defaultFontColor = '#777';

    let massPopChart = new Chart(myChart, {
      type:'pie', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
      data:{
    labels:['Excellent', 'Good', 'Satisfactory', 'Bad' ],       
    datasets:[{
          label:'Population',
          data:[
            a[1],
            a[2],
            a[3],
            a[4]
            
          ],
          //backgroundColor:'green',
          backgroundColor:[
            'rgba(0, 255, 0, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(255, 0, 0, 0.6)'
          ],
          borderWidth:1,
          borderColor:'#777',
          hoverBorderWidth:3,
          hoverBorderColor:'#000'
        }]

        
        },options:{
         
        title:{
          display:true,
          text:'SERVICE',
          fontSize:30,
          fontcolor:'#',
          fullWidth: false,
          positiion:'bottom'
        },
        legend:{
          display:true,
          position:'bottom',
          
          fullWidth: false,
          labels:{
            fontColor:'#000',
            display: true,
            usePointStyle: false,
            fontSize: 15,
            fontcolor:'white',
            paddingleft:500
          }
        },
        
        layout:{
          padding:{
            left:50,
            right:0,
            bottom:0,
            top:0
          }
        },
        tooltips:{
          enabled:true
        }
      }
    });
    
    
    //food
    
    
    let myChart1 = document.getElementById('myChart1').getContext('2d');

    Chart.defaults.global.defaultFontFamily = 'Lato';
    Chart.defaults.global.defaultFontSize = 18;
    Chart.defaults.global.defaultFontColor = '#777';

    let massPopChart1 = new Chart(myChart1, {
      type:'pie', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
      data:{
        labels:['Excellent', 'Good', 'Satisfactory', 'Bad' ],
        datasets:[{
          label:'Population',
          data:[
            a[9],
            a[10],
            a[11],
            a[12]
          ],
          //backgroundColor:'green',
          backgroundColor:[
            'rgba(0, 255, 0, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(255, 0, 0, 0.6)'
          ],
          borderWidth:1,
          borderColor:'#777',
          hoverBorderWidth:3,
          hoverBorderColor:'#000'
        }]
      },options:{
        title:{
          display:true,
          text:'FOOD',
          fontSize:30
        },
        legend:{
          display:true,
          position:'bottom',
          labels:{
            fontColor:'#000',
            display: false,
            usePointStyle: false,
            fontSize: 15
          }
        },
        
        layout:{
          padding:{
            left:0,
            right:0,
            bottom:0,
            top:0
          }
        },
        tooltips:{
          enabled:true
        }
      }
    });
    let myChart2 = document.getElementById('myChart2').getContext('2d');

    // Global Options
    Chart.defaults.global.defaultFontFamily = 'Lato';
    Chart.defaults.global.defaultFontSize = 18;
    Chart.defaults.global.defaultFontColor = '#777';

    let massPopChart2 = new Chart(myChart2, {
      type:'pie', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
      data:{
    labels:['Excellent', 'Good', 'Satisfactory', 'Bad' ],       
    datasets:[{
          label:'Population',
          data:[
            a[5],
            a[6],
            a[7],
            a[8]
            
          ],
          //backgroundColor:'green',
          backgroundColor:[
            'rgba(0, 255, 0, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(255, 0, 0, 0.6)'
          ],
          borderWidth:1,
          borderColor:'#777',
          hoverBorderWidth:3,
          hoverBorderColor:'#000'
        }]

        
        },options:{
         
        title:{
          display:true,
          text:'AMBIENCE',
          fontSize:30,
          color:'olive',
          fullWidth: false,
          positiion:'bottom'
        },
        legend:{
          display:true,
          position:'bottom',
          
          fullWidth: false,
          labels:{
            fontColor:'#000',
            display: false,
            usePointStyle: false,
            fontSize: 15,
            paddingleft:500
          }
        },
        
        layout:{
          padding:{
            left:50,
            right:0,
            bottom:0,
            top:0
          }
        },
        tooltips:{
          enabled:true
        }
      }
    });

document.getElementById("clear").innerHTML="";   
}