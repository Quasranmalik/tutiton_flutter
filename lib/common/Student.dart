import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tutiton_flutter/common/CircleBackground.dart';

class Student extends StatelessWidget {
  final bool expanded;
  final String name;
  final int pendingMonths;
  final int? upcomingDays;
  final void Function() onPay;
  final void Function(bool) onExpandToggle;

  const Student({super.key,
  required this.expanded,
  required this.name,
  required this.pendingMonths,
  this.upcomingDays,
  required this.onPay,
  required this.onExpandToggle
  });


  @override
  Widget build(BuildContext context) {
    final isFeePending = pendingMonths > 0;
    return  Column(
      children: [
         ListTile(
          leading: const Icon(Icons.person,semanticLabel: "Student",),
          title:_buildStudentName(),
          trailing: SizedBox(
            width:50,
            child: Row(children: [
            
              if (upcomingDays != null) 
                _buildUpcomingDaysBadge(),
              const Gap(15), 
              if (isFeePending)...[
                _buildPendingMonthsBadge(),
                _buildDropDown()
              ]
              
              
            ],),
          ),
         ),
         

      ],

    );
  }

  Widget _buildStudentName() {
    return Builder(builder: (context) => Text(name,
      style : Theme.of(context).textTheme.titleLarge));
  }
  
  Widget _buildUpcomingDaysBadge() =>
    Builder(builder: (context){
      return Text("$upcomingDays",
      style:Theme.of(context).textTheme.bodyLarge);
    } );
  
  Widget _buildPendingMonthsBadge() => 
  Builder(builder: (context){
    
    return CircleBackground(
      padding:const EdgeInsets.all(2),
      child: Text("$pendingMonths",
      style:Theme.of(context).textTheme.labelSmall)
    );
  });

  Widget _buildDropDown() {
    return AnimatedSwitcher(duration:const Duration(seconds: 4),
          child:GestureDetector(
            onTap: ()=> onExpandToggle(expanded),
            child:expanded
            ?const Icon(Icons.arrow_upward)
            :const Icon(Icons.arrow_downward)
          ),
          
        );
  }
}


class PendingFeeCard extends StatelessWidget {

  
  const PendingFeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    return  SizedBox(
      width:double.infinity,
      child: Padding(padding: const EdgeInsets.all(5),
        child:Row(
          children: [
            Padding(padding: const EdgeInsets.all(10),
              child: Text("123",style: titleLarge,),
            ),
            const Spacer(),
            FilledButton(onPressed: (){}, 
            child: Text("Pay",style: titleLarge,)
            )
          ],
        )
      ),
    );
  }
}

