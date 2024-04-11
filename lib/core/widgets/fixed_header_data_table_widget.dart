import 'package:flutter/material.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

import '../theme/app_color.dart';

class FixedHeaderDataTableWidget extends StatelessWidget {
  const FixedHeaderDataTableWidget(
      {super.key, required this.columns, required this.cells, required this.columnWidths});

  final List<String> columns;
  final List<List<String>> cells;
  final List<double> columnWidths;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 20,
          start: 10.0,
          end: 10.0
        ),
        child: Container(
            decoration: const BoxDecoration(
                color: AppColors.complementaryColor2,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(12))),
            child: StickyHeadersTable(
              columnsLength: columns.length,
              rowsLength: cells.length,
              cellDimensions: CellDimensions.variableColumnWidth(
                  columnWidths: columnWidths,
                  contentCellHeight: 50.0,
                  stickyLegendWidth: 50.0,
                  stickyLegendHeight: 50.0),
              cellAlignments: CellAlignments.uniform(Alignment.center),
              columnsTitleBuilder: (columnIndex) => Text(columns[columnIndex],
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              contentCellBuilder: (columnIndex, rowIndex) =>
                  Text(cells[rowIndex][columnIndex]),
              rowsTitleBuilder: (int rowIndex) => Text('${rowIndex + 1}'),
              legendCell: const Text('#'),
              // cellAlignments: const CellAlignments.uniform(Alignment.center),
            )));
  }
}
