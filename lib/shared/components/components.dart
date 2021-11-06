
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String? Function(String?)? validate,
  VoidCallback? onPressed,
  VoidCallback? onTap,
  dynamic? onChange,
  required IconData prefixIcon,
  required String label,
  IconData? suffixIcon,
  bool isPassword = false,
  bool readOnly = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null
            ? IconButton(
          onPressed: onPressed,
          icon: Icon(
            suffixIcon,
          ),
        )
            : null,
      ),
      validator: validate,
      onTap: onTap,
      readOnly: readOnly,
    );


Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget buildArticleItem(article, context)=>InkWell(

  onTap: (){
    navigateTo(context, WebViewScreen(url:article['url']),);
  },

  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image: DecorationImage(

              image: NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(width: 20.0,),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children:

              [

                Expanded(

                  child: Text(

                    '${article['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text(

                  '${article['publishedAt']}',

                  style: TextStyle(

                    color: Colors.grey,

                  ),

                ),

              ],

            ),

          ),

        ),

        SizedBox(

          width: 15.0,

        ),

      ],

    ),

  ),
);

Widget articleBuilder(list, context, {iaSearch= false})=>BuildCondition(
  condition: list.length>0,
  builder:(context)=>
  ListView.separated(
      itemBuilder: (context, index)=> buildArticleItem(list[index], context),
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) =>myDivider(),
      itemCount: 10),
  fallback: (context)=> iaSearch? Container():Center(child: CircularProgressIndicator(color: Colors.deepOrange)),
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);