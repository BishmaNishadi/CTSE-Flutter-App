import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/screen/booking/barrel_booking.dart';
import 'package:flutter/material.dart';

class BookTimeSlotScreen extends StatelessWidget {
  List<ItemTheaterTimeSlot> items = [
    ItemTheaterTimeSlot(
      'Savoy Metro Maharagama',
      'Maharagama',
      '10km away',
      [
        ItemTheater('10:30 AM', 10, true),
        ItemTheater('1:30 PM', 13, true),
        ItemTheater('6:30 PM', 6, true),
      ],
    ),
    ItemTheaterTimeSlot(
      'Savoy Metro Gampaha',
      'Wardcity Shopping Complex',
      '12km away',
      [
        ItemTheater('10:30 AM', 10, true),
        ItemTheater('1:30 PM', 13, true),
        ItemTheater('6:30 PM', 6, false),
      ],
    ),
    ItemTheaterTimeSlot(
      'Sinexpo 3D',
      'Kurunegala',
      '45km away',
      [
        ItemTheater('9:30 AM', 10, true),
        ItemTheater('6:30 PM', 13, true),
      ],
    ),
    ItemTheaterTimeSlot(
      'Excel 3D',
      'Colombo 10',
      '4km away',
      [
        ItemTheater('10:00 AM', 10, true),
        ItemTheater('1:30 PM', 13, true),
        ItemTheater('6:30 PM', 6, true),
      ],
    )
  ];

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              WidgetToolbar.defaultActions(title: 'Rush'),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    _buildListTheaterTimeSlot(),
//                    _buildBtnToday(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildListTheaterTimeSlot() {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index < items.length) {
          var item = items[index];
          return WidgetTheaterTimeSlot(item);
        } else {
          return WidgetSpacer(height: 55);
        }
      },
      separatorBuilder: (context, index) {
        return WidgetSpacer(
          height: 14,
        );
      },
      itemCount: items.length + 1,
      physics: BouncingScrollPhysics(),
    );
  }

  void openTheaterPosiDate() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: _context,
      builder: (context) {
//        return CineDatePickerScreen();
      },
    );
  }
}

class ItemTheaterTimeSlot {
  String theaterName;
  String textLocation;
  String textDistance;
  List<ItemTheater> timeSlots;

  ItemTheaterTimeSlot(
      this.theaterName, this.textLocation, this.textDistance, this.timeSlots);
}
