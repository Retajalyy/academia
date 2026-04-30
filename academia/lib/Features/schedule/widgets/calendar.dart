import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
 
class CalendarWidget extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
 
  const CalendarWidget({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
  }) : super(key: key);
 
  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}
 
class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime _currentMonth;
 
  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime(widget.selectedDate.year, widget.selectedDate.month);
  }
 
  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }
 
  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }
 
  List<DateTime?> _getDaysInMonth() {
    final firstDay = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final lastDay = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    final List<DateTime?> days = [];
 
    // Add empty slots for days before the first of month (Sunday = 0)
    for (int i = 0; i < firstDay.weekday % 7; i++) {
      days.add(null);
    }
    for (int i = 1; i <= lastDay.day; i++) {
      days.add(DateTime(_currentMonth.year, _currentMonth.month, i));
    }
    return days;
  }
 
  String _monthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
 
  @override
  Widget build(BuildContext context) {
    final days = _getDaysInMonth();
    const weekDays = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
 
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Month/Year header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _previousMonth,
                icon: const Icon(Icons.chevron_left, color: Colors.white),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              Row(
                children: [
                  _MonthYearDropdown(
                    value: _monthName(_currentMonth.month),
                    items: ['Jan','Feb','Mar','Apr','May','Jun',
                            'Jul','Aug','Sep','Oct','Nov','Dec'],
                    onChanged: (val) {
                      if (val != null) {
                        final idx = ['Jan','Feb','Mar','Apr','May','Jun',
                                     'Jul','Aug','Sep','Oct','Nov','Dec']
                            .indexOf(val) + 1;
                        setState(() {
                          _currentMonth = DateTime(_currentMonth.year, idx);
                        });
                      }
                    },
                  ),
                  const SizedBox(width: 8),
                  _MonthYearDropdown(
                    value: _currentMonth.year.toString(),
                    items: List.generate(10, (i) => (2020 + i).toString()),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _currentMonth = DateTime(int.parse(val), _currentMonth.month);
                        });
                      }
                    },
                  ),
                ],
              ),
              IconButton(
                onPressed: _nextMonth,
                icon: const Icon(Icons.chevron_right, color: Colors.white),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Weekday headers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: weekDays.map((d) => SizedBox(
              width: 36,
              child: Center(
                child: Text(
                  d,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )).toList(),
          ),
          const SizedBox(height: 8),
          // Calendar grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
              mainAxisSpacing: 4,
              crossAxisSpacing: 0,
            ),
            itemCount: days.length,
            itemBuilder: (context, index) {
              final day = days[index];
              if (day == null) return const SizedBox();
 
              final isSelected = day.day == widget.selectedDate.day &&
                  day.month == widget.selectedDate.month &&
                  day.year == widget.selectedDate.year;
 
              return GestureDetector(
                onTap: () => widget.onDateSelected(day),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        color: isSelected ? AppColors.primaryBlue : Colors.white,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
 
class _MonthYearDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String?) onChanged;
 
  const _MonthYearDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          items: items.map((item) => DropdownMenuItem(
            value: item,
            child: Text(item, style: const TextStyle(color: Colors.white, fontSize: 14)),
          )).toList(),
          onChanged: onChanged,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 16),
          dropdownColor: AppColors.primaryBlue,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}