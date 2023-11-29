import 'package:SportRabbit/models/drill_model.dart';
import 'package:SportRabbit/providers/DrillsProvider.dart';
import 'package:SportRabbit/screens/drills_list/widgets/drill_lesson_list_item_widget.dart';
import 'package:SportRabbit/services/enums/data_loading_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DrillsListViewWidget extends StatelessWidget {
  final List<DrillModel> _data;
  bool _isLoading;
  DrillsListViewWidget(this._data, this._isLoading, {super.key});

  late DataState _dataState;
  late BuildContext _buildContext;
  late double leftAndRightPadding = 15;

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    _dataState = Provider.of<DrillsProvider>(_buildContext).dataState;
    return Padding(
        padding:
            EdgeInsets.fromLTRB(leftAndRightPadding, 0, leftAndRightPadding, 0),
        child: _scrollNotificationListener(context));
  }

  Widget _scrollNotificationListener(BuildContext context) {
    return Column(children: [
      Expanded(
          child: NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                return _scrollNotification(
                  scrollInfo,
                );
              },
              child: RefreshIndicator(
                  onRefresh: () async {
                    await _onRefresh();
                  },
                  child: ListView.builder(
                      itemCount: _data.length + 1,
                      itemBuilder: (context, index) {
                        // show seach field on 0 index
                        if (index == 0) {
                          return const DrillLessonListItemWidget();
                        } else {
                          DrillModel _drill = _data[index - 1];
                          print(_drill.title);
                          return Text(_drill.title!);

                          // ListTile(
                          //     // leading: CachedNetworkImageWidget(
                          //     //     imageUrl: _drill.thumbnail!),
                          //     title: Text(_drill.title!),
                          //     subtitle: Text(_drill.duration!.toString()),
                          //     trailing: const Icon(Icons.arrow_forward_ios),
                          //     );
                        }
                      })))),
      if (_dataState == DataState.More_Fetching)
        Center(
            child: SizedBox(
          height: 15,
          width: 15,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
                strokeWidth: 0.6, color: Theme.of(context).primaryColor),
          ),
        )),
      if (_dataState == DataState.No_More_Data)
        Center(
            child: Text("No more games",
                style: Theme.of(context).textTheme.bodySmall))
    ]);
  }

  // when list veiw scroll will reach at bottom, we will call next page api
  bool _scrollNotification(ScrollNotification scrollInfo) {
    if (!_isLoading &&
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      _isLoading = true;
      Provider.of<DrillsProvider>(_buildContext, listen: false)
          .fetchDrillsByGame();
    }
    return true;
  }

  // when user pull down list view, we will call refresh api
  _onRefresh() async {
    if (!_isLoading) {
      _isLoading = true;

      Provider.of<DrillsProvider>(_buildContext, listen: false)
          .fetchDrillsByGame(search: "", isRefresh: true);
    }
  }
}
