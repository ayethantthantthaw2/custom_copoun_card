import 'dart:ffi';

import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'copoun_clipper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coupon Cards Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coupon Cards Demo')),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CouponCard(
                height: 100,
                firstChild: Container(
                  color: Colors.orange,
                  height: 100,
                  width: 100,
                ),
                secondChild: ClipPath(
                  clipper:
                      // RoundedEdgeClipper(edge: Edge.right, points: 8, depth: 4),
                      CuponClipper(),
                  child: Container(
                    color: Colors.orange,
                    height: 100,
                    width: 160,
                  ),
                ),
                // clockwise: true,
                curveAxis: Axis.vertical,
              ),
              const SizedBox(
                height: 20,
              ),
              const PromoCoupon(
                holeRadius: 12,
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/copoun.png',
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PromoCoupon extends StatelessWidget {
  const PromoCoupon({
    super.key,
    this.ticketPassClipperPosition,
    required this.holeRadius,
    this.radius,
    this.firstChildWidth,
    this.firstChildHeight,
    this.secondChildWidth,
    this.secondChildHeight,
  });

  final double? ticketPassClipperPosition;
  final double holeRadius;
  final double? radius;
  final double? firstChildWidth;
  final double? firstChildHeight;
  final double? secondChildWidth;
  final double? secondChildHeight;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketPassClipper(
          position: ticketPassClipperPosition ?? 100 + holeRadius / 2,
          holeRadius: holeRadius),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius ?? 20),
                bottomLeft: Radius.circular(radius ?? 20),
              ),
              color: Colors.orange.shade900,
            ),
            height: firstChildHeight ?? 100,
            width: firstChildWidth ?? 100,
          ),
          ClipPath(
            clipper:
                // RoundedEdgeClipper(edge: Edge.right, points: 8, depth: 4),
                CuponClipper(),
            child: Container(
              color: Colors.orange.shade900,
              height: secondChildHeight ?? 100,
              width: secondChildWidth ?? 160,
            ),
          ),
        ],
      ),
    );
  }
}
