import 'package:delicyfood/business/bloc/centralProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Voucher extends StatefulWidget {
  int numV = 0;
  int couunt = 1;

  @override
  _VoucherState createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  @override
  Widget build(BuildContext context) {
    var cost = Provider.of<TotalPrice>(context, listen: false);

    return Container(
      child: Column(
        children: <Widget>[
          TextFormField(
//controller: emailr,
            onChanged: (value) => widget.numV = int.parse(value),
            keyboardType: TextInputType.number,

            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFFe7edeb),
                hintText: "add voucher ",
                prefixIcon: Icon(
                  Icons.local_offer_rounded,
                  color: Colors.grey[700],
                )),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            onPressed: () {
              if (cost.num > 50) {
                if (widget.couunt == 1) {
                  widget.couunt = 0;
                  if (widget.numV == 010 ||
                      widget.numV == 012 ||
                      widget.numV == 011) {
                    cost.decremnt(20);
                  }
                } else {
                  SnackBar snackBar = SnackBar(
                    content: Text("Voucher is Expired"),
                    backgroundColor: Colors.blueGrey,
                    duration: Duration(milliseconds: 2000),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              } else {
                SnackBar snackBar = SnackBar(
                  content: Text("reach to 50 LE to get Voucher"),
                  backgroundColor: Colors.blueGrey,
                  duration: Duration(milliseconds: 2000),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            color: Colors.teal,
            child: Text(
              " Send",
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
