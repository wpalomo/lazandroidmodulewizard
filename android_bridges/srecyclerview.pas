unit srecyclerview;

{$mode delphi}

interface

uses
  Classes, SysUtils, And_jni, And_jni_Bridge, AndroidWidget, Laz_And_Controls;

type

  TRecyclerViewOnItemClick = procedure(Sender: TObject; itemPosition: integer; itemArrayOfStringCount: integer) of object;

  TLayoutModel = (lmLinear, lmGrid, lmStaggeredGrid);
  TLayoutOrientation = (loVertical, loHorizontal);

{Draft Component code by "Lazarus Android Module Wizard" [12/21/2017 0:30:02]}
{https://github.com/jmpessoa/lazandroidmodulewizard}

{jVisualControl template}

jsRecyclerView = class(jVisualControl)
 private
    FLayoutModel: TLayoutModel;
    FLayoutOrientation: TLayoutOrientation;
    FColumns: integer;
    FFitsSystemWindows: boolean;
    FOnItemClick: TRecyclerViewOnItemClick;
    procedure SetVisible(Value: Boolean);
    procedure SetColor(Value: TARGBColorBridge); //background
    procedure UpdateLParamHeight;
    procedure UpdateLParamWidth;
    procedure TryNewParent(refApp: jApp);
 public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Init(refApp: jApp); override;
    procedure Refresh;
    procedure UpdateLayout; override;
    procedure ClearLayout;

    procedure GenEvent_OnRecyclerViewItemClick(Obj: TObject; itemIndex: integer; arrayContentCount: integer);
    //function jCreate(): jObject;
    function jCreate( _mode: integer; _direction: integer; _cols: integer): jObject;
    procedure jFree();
    procedure SetViewParent(_viewgroup: jObject); override;
    function GetParent(): jObject;
    procedure RemoveFromViewParent(); override;
    function GetView(): jObject;  override;
    procedure SetLParamWidth(_w: integer);
    procedure SetLParamHeight(_h: integer);
    function GetLParamWidth(): integer;
    function GetLParamHeight(): integer;
    procedure SetLGravity(_gravity: TLayoutGravity);
    procedure SetLWeight(_w: single);
    procedure SetLeftTopRightBottomWidthHeight(_left: integer; _top: integer; _right: integer; _bottom: integer; _w: integer; _h: integer);
    procedure AddLParamsAnchorRule(_rule: integer);
    procedure AddLParamsParentRule(_rule: integer);
    procedure SetLayoutAll(_idAnchor: integer);
    procedure ClearLayoutAll();
    procedure SetId(_id: integer);
    procedure SetItemContentFormat(_delimitedContentFormat: string; _delimiter: string); overload;
    procedure SetItemContentFormat(_contentFormat: string); overload;
    procedure Add(_delimitedContent: string);
    function GetSelectedContent(_contentIndex: integer): string;
    procedure SetItemContentLayout(_itemViewLayout: jObject); overload;
    procedure SetItemContentLayout(_itemViewLayout: jObject; _forceCardStyle: boolean);  overload;
    procedure SetSeparatorDecorationColor(_color: TARGBColorBridge);
    procedure SetAppBarLayoutScrollingViewBehavior();
    procedure Remove(_position: integer);
    function GetItemCount(): integer;
    procedure SetFitsSystemWindows(_value: boolean);
    procedure SetClipToPadding(_value: boolean);

 published
    property BackgroundColor: TARGBColorBridge read FColor write SetColor;
    //property OnClick: TOnNotify read FOnClick write FOnClick;
    property Model: TLayoutModel read FLayoutModel write FLayoutModel;
    property Orientation: TLayoutOrientation read FLayoutOrientation write FLayoutOrientation;
    property Columns: integer read FColumns write FColumns;
    property GravityInParent: TLayoutGravity read FGravityInParent write SetLGravity;
    property OnItemClick: TRecyclerViewOnItemClick read FOnItemClick write FOnItemClick;

end;

//function jsRecyclerView_jCreate(env: PJNIEnv;_Self: int64; this: jObject): jObject;
function jsRecyclerView_jCreate(env: PJNIEnv;_Self: int64; _mode: integer; _direction: integer; _cols: integer; this: jObject): jObject;
procedure jsRecyclerView_jFree(env: PJNIEnv; _jsrecyclerview: JObject);
procedure jsRecyclerView_SetViewParent(env: PJNIEnv; _jsrecyclerview: JObject; _viewgroup: jObject);
function jsRecyclerView_GetParent(env: PJNIEnv; _jsrecyclerview: JObject): jObject;
procedure jsRecyclerView_RemoveFromViewParent(env: PJNIEnv; _jsrecyclerview: JObject);
function jsRecyclerView_GetView(env: PJNIEnv; _jsrecyclerview: JObject): jObject;
procedure jsRecyclerView_SetLParamWidth(env: PJNIEnv; _jsrecyclerview: JObject; _w: integer);
procedure jsRecyclerView_SetLParamHeight(env: PJNIEnv; _jsrecyclerview: JObject; _h: integer);
function jsRecyclerView_GetLParamWidth(env: PJNIEnv; _jsrecyclerview: JObject): integer;
function jsRecyclerView_GetLParamHeight(env: PJNIEnv; _jsrecyclerview: JObject): integer;
procedure jsRecyclerView_SetLGravity(env: PJNIEnv; _jsrecyclerview: JObject; _g: integer);
procedure jsRecyclerView_SetLWeight(env: PJNIEnv; _jsrecyclerview: JObject; _w: single);
procedure jsRecyclerView_SetLeftTopRightBottomWidthHeight(env: PJNIEnv; _jsrecyclerview: JObject; _left: integer; _top: integer; _right: integer; _bottom: integer; _w: integer; _h: integer);
procedure jsRecyclerView_AddLParamsAnchorRule(env: PJNIEnv; _jsrecyclerview: JObject; _rule: integer);
procedure jsRecyclerView_AddLParamsParentRule(env: PJNIEnv; _jsrecyclerview: JObject; _rule: integer);
procedure jsRecyclerView_SetLayoutAll(env: PJNIEnv; _jsrecyclerview: JObject; _idAnchor: integer);
procedure jsRecyclerView_ClearLayoutAll(env: PJNIEnv; _jsrecyclerview: JObject);
procedure jsRecyclerView_SetId(env: PJNIEnv; _jsrecyclerview: JObject; _id: integer);
procedure jsRecyclerView_SetItemContentDictionary(env: PJNIEnv; _jsrecyclerview: JObject; _delimitedContentDictionary: string; _delimiter: string);
procedure jsRecyclerView_Add(env: PJNIEnv; _jsrecyclerview: JObject; _delimitedContent: string);
function jsRecyclerView_GetSelectedContent(env: PJNIEnv; _jsrecyclerview: JObject; _contentIndex: integer): string;
procedure jsRecyclerView_SetlayoutView(env: PJNIEnv; _jsrecyclerview: JObject; _itemViewLayout: jObject);
procedure jsRecyclerView_SetItemViewLayout(env: PJNIEnv; _jsrecyclerview: JObject; _itemViewLayout: jObject; _forceCardStyle: boolean);
procedure jsRecyclerView_SetSeparatorDecorationColor(env: PJNIEnv; _jsrecyclerview: JObject; _separatorColor: integer);
procedure jsRecyclerView_SetAppBarLayoutScrollingViewBehavior(env: PJNIEnv; _jsrecyclerview: JObject);
procedure jsRecyclerView_Remove(env: PJNIEnv; _jsrecyclerview: JObject; _position: integer);
function jsRecyclerView_GetItemCount(env: PJNIEnv; _jsrecyclerview: JObject): integer;
procedure jsRecyclerView_SetFitsSystemWindows(env: PJNIEnv; _jsrecyclerview: JObject; _value: boolean);
procedure jsRecyclerView_SetClipToPadding(env: PJNIEnv; _jsrecyclerview: JObject; _value: boolean);

implementation

uses
  customdialog, viewflipper, toolbar, scoordinatorlayout, linearlayout,
  sdrawerlayout, scollapsingtoolbarlayout, scardview, sappbarlayout,
  stoolbar, stablayout, snestedscrollview, sviewpager, framelayout;


{---------  jsRecyclerView  --------------}

constructor jsRecyclerView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMarginLeft   := 10;
  FMarginTop    := 10;
  FMarginBottom := 10;
  FMarginRight  := 10;
  FHeight       := 96; //??
  FWidth        := 96; //??
  FLParamWidth  := lpMatchParent;  //lpWrapContent
  FLParamHeight := lpWrapContent; //lpMatchParent
  FAcceptChildrenAtDesignTime:= False;
//your code here....
  FLayoutModel:= lmLinear;
  FLayoutOrientation:= loVertical;
  FColumns:= 1;
end;

destructor jsRecyclerView.Destroy;
begin
  if not (csDesigning in ComponentState) then
  begin
     if FjObject <> nil then
     begin
       jFree();
       FjObject:= nil;
     end;
  end;
  //you others free code here...'
  inherited Destroy;
end;

procedure jsRecyclerView.TryNewParent(refApp: jApp);
begin
  if FParent is jPanel then
  begin
    jPanel(FParent).Init(refApp);
    FjPRLayout:= jPanel(FParent).View;
  end else
  if FParent is jScrollView then
  begin
    jScrollView(FParent).Init(refApp);
    FjPRLayout:= jScrollView_getView(FjEnv, jScrollView(FParent).jSelf);
  end else
  if FParent is jHorizontalScrollView then
  begin
    jHorizontalScrollView(FParent).Init(refApp);
    FjPRLayout:= jHorizontalScrollView_getView(FjEnv, jHorizontalScrollView(FParent).jSelf);
  end  else
  if FParent is jCustomDialog then
  begin
    jCustomDialog(FParent).Init(refApp);
    FjPRLayout:= jCustomDialog(FParent).View;
  end else
  if FParent is jViewFlipper then
  begin
    jViewFlipper(FParent).Init(refApp);
    FjPRLayout:= jViewFlipper(FParent).View;
  end else
  if FParent is jToolbar then
  begin
    jToolbar(FParent).Init(refApp);
    FjPRLayout:= jToolbar(FParent).View;
  end  else
  if FParent is jsToolbar then
  begin
    jsToolbar(FParent).Init(refApp);
    FjPRLayout:= jsToolbar(FParent).View;
  end  else
  if FParent is jsCoordinatorLayout then
  begin
    jsCoordinatorLayout(FParent).Init(refApp);
    FjPRLayout:= jsCoordinatorLayout(FParent).View;
  end else
  if FParent is jFrameLayout then
  begin
    jFrameLayout(FParent).Init(refApp);
    FjPRLayout:= jFrameLayout(FParent).View;
  end else
  if FParent is jLinearLayout then
  begin
    jLinearLayout(FParent).Init(refApp);
    FjPRLayout:= jLinearLayout(FParent).View;
  end else
  if FParent is jsDrawerLayout then
  begin
    jsDrawerLayout(FParent).Init(refApp);
    FjPRLayout:= jsDrawerLayout(FParent).View;
  end  else
  if FParent is jsCardView then
  begin
      jsCardView(FParent).Init(refApp);
      FjPRLayout:= jsCardView(FParent).View;
  end else
  if FParent is jsAppBarLayout then
  begin
      jsAppBarLayout(FParent).Init(refApp);
      FjPRLayout:= jsAppBarLayout(FParent).View;
  end else
  if FParent is jsTabLayout then
  begin
      jsTabLayout(FParent).Init(refApp);
      FjPRLayout:= jsTabLayout(FParent).View;
  end else
  if FParent is jsCollapsingToolbarLayout then
  begin
      jsCollapsingToolbarLayout(FParent).Init(refApp);
      FjPRLayout:= jsCollapsingToolbarLayout(FParent).View;
  end else
  if FParent is jsNestedScrollView then
  begin
      jsNestedScrollView(FParent).Init(refApp);
      FjPRLayout:= jsNestedScrollView(FParent).View;
  end else
  if FParent is jsViewPager then
  begin
      jsViewPager(FParent).Init(refApp);
      FjPRLayout:= jsViewPager(FParent).View;
  end;
end;

procedure jsRecyclerView.Init(refApp: jApp);
var
  rToP: TPositionRelativeToParent;
  rToA: TPositionRelativeToAnchorID;
begin
  if FInitialized  then Exit;
  inherited Init(refApp); //set default ViewParent/FjPRLayout as jForm.View!
  //your code here: set/initialize create params....
  //FjObject:= jCreate(); //jSelf !
  FjObject:= jCreate(Ord(FLayoutModel), Ord(FLayoutOrientation), FColumns); //jSelf !

  FInitialized:= True;

  if FParent <> nil then
  begin
    TryNewParent(refApp);
  end;

  FjPRLayoutHome:= FjPRLayout;


  if FGravityInParent <> lgNone then
     jsRecyclerView_SetLGravity(FjEnv, FjObject, Ord(FGravityInParent));

  jsRecyclerView_SetViewParent(FjEnv, FjObject, FjPRLayout);
  jsRecyclerView_SetId(FjEnv, FjObject, Self.Id);
  jsRecyclerView_SetLeftTopRightBottomWidthHeight(FjEnv, FjObject,
                        FMarginLeft,FMarginTop,FMarginRight,FMarginBottom,
                        GetLayoutParams(gApp, FLParamWidth, sdW),
                        GetLayoutParams(gApp, FLParamHeight, sdH));

  if FParent is jPanel then
  begin
    Self.UpdateLayout;
  end;

  for rToA := raAbove to raAlignRight do
  begin
    if rToA in FPositionRelativeToAnchor then
    begin
      jsRecyclerView_AddLParamsAnchorRule(FjEnv, FjObject, GetPositionRelativeToAnchor(rToA));
    end;
  end;
  for rToP := rpBottom to rpCenterVertical do
  begin
    if rToP in FPositionRelativeToParent then
    begin
      jsRecyclerView_AddLParamsParentRule(FjEnv, FjObject, GetPositionRelativeToParent(rToP));
    end;
  end;

  if Self.Anchor <> nil then Self.AnchorId:= Self.Anchor.Id
  else Self.AnchorId:= -1; //dummy

  jsRecyclerView_SetLayoutAll(FjEnv, FjObject, Self.AnchorId);

  if  FColor <> colbrDefault then
    View_SetBackGroundColor(FjEnv, FjObject, GetARGB(FCustomColor, FColor));

  View_SetVisible(FjEnv, FjObject, FVisible);
end;

procedure jsRecyclerView.SetColor(Value: TARGBColorBridge);
begin
  FColor:= Value;
  if (FInitialized = True) and (FColor <> colbrDefault)  then
    View_SetBackGroundColor(FjEnv, FjObject, GetARGB(FCustomColor, FColor));
end;
procedure jsRecyclerView.SetVisible(Value : Boolean);
begin
  FVisible:= Value;
  if FInitialized then
    View_SetVisible(FjEnv, FjObject, FVisible);
end;
procedure jsRecyclerView.UpdateLParamWidth;
var
  side: TSide;
begin
  if FInitialized then
  begin
    if Self.Parent is jForm then
    begin
      if jForm(Owner).ScreenStyle = (FParent as jForm).ScreenStyleAtStart  then side:= sdW else side:= sdH;
      jsRecyclerView_SetLParamWidth(FjEnv, FjObject, GetLayoutParams(gApp, FLParamWidth, side));
    end
    else
    begin
      if (Self.Parent as jVisualControl).LayoutParamWidth = lpWrapContent then
        jsRecyclerView_setLParamWidth(FjEnv, FjObject , GetLayoutParams(gApp, FLParamWidth, sdW))
      else //lpMatchParent or others
        jsRecyclerView_setLParamWidth(FjEnv,FjObject,GetLayoutParamsByParent((Self.Parent as jVisualControl), FLParamWidth, sdW));
    end;
  end;
end;

procedure jsRecyclerView.UpdateLParamHeight;
var
  side: TSide;
begin
  if FInitialized then
  begin
    if Self.Parent is jForm then
    begin
      if jForm(Owner).ScreenStyle = (FParent as jForm).ScreenStyleAtStart then side:= sdH else side:= sdW;
      jsRecyclerView_SetLParamHeight(FjEnv, FjObject, GetLayoutParams(gApp, FLParamHeight, side));
    end
    else
    begin
      if (Self.Parent as jVisualControl).LayoutParamHeight = lpWrapContent then
        jsRecyclerView_setLParamHeight(FjEnv, FjObject , GetLayoutParams(gApp, FLParamHeight, sdH))
      else //lpMatchParent and others
        jsRecyclerView_setLParamHeight(FjEnv,FjObject,GetLayoutParamsByParent((Self.Parent as jVisualControl), FLParamHeight, sdH));
    end;
  end;
end;

procedure jsRecyclerView.UpdateLayout;
begin
  if FInitialized then
  begin
    inherited UpdateLayout;
    UpdateLParamWidth;
    UpdateLParamHeight;
  jsRecyclerView_SetLayoutAll(FjEnv, FjObject, Self.AnchorId);
  end;
end;

procedure jsRecyclerView.Refresh;
begin
  if FInitialized then
    View_Invalidate(FjEnv, FjObject);
end;

procedure jsRecyclerView.ClearLayout;
var
   rToP: TPositionRelativeToParent;
   rToA: TPositionRelativeToAnchorID;
begin
 jsRecyclerView_ClearLayoutAll(FjEnv, FjObject );
   for rToP := rpBottom to rpCenterVertical do
   begin
      if rToP in FPositionRelativeToParent then
        jsRecyclerView_AddLParamsParentRule(FjEnv, FjObject , GetPositionRelativeToParent(rToP));
   end;
   for rToA := raAbove to raAlignRight do
   begin
     if rToA in FPositionRelativeToAnchor then
       jsRecyclerView_AddLParamsAnchorRule(FjEnv, FjObject , GetPositionRelativeToAnchor(rToA));
   end;
end;

//Event : Java -> Pascal

procedure jsRecyclerView.GenEvent_OnRecyclerViewItemClick(Obj: TObject; itemIndex: integer; arrayContentCount: integer);
begin
  if Assigned(FOnItemClick) then FOnItemClick(Obj, itemIndex, arrayContentCount);
end;
{
function jsRecyclerView.jCreate(): jObject;
begin
   Result:= jsRecyclerView_jCreate(FjEnv, int64(Self), FjThis);
end;
}
function jsRecyclerView.jCreate( _mode: integer; _direction: integer; _cols: integer): jObject;
begin
   Result:= jsRecyclerView_jCreate(FjEnv, int64(Self), _mode ,_direction ,_cols, FjThis);
end;

procedure jsRecyclerView.jFree();
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_jFree(FjEnv, FjObject);
end;

procedure jsRecyclerView.SetViewParent(_viewgroup: jObject);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_SetViewParent(FjEnv, FjObject, _viewgroup);
end;

function jsRecyclerView.GetParent(): jObject;
begin
  //in designing component state: result value here...
  if FInitialized then
   Result:= jsRecyclerView_GetParent(FjEnv, FjObject);
end;

procedure jsRecyclerView.RemoveFromViewParent();
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_RemoveFromViewParent(FjEnv, FjObject);
end;

function jsRecyclerView.GetView(): jObject;
begin
  //in designing component state: result value here...
  if FInitialized then
   Result:= jsRecyclerView_GetView(FjEnv, FjObject);
end;

procedure jsRecyclerView.SetLParamWidth(_w: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_SetLParamWidth(FjEnv, FjObject, _w);
end;

procedure jsRecyclerView.SetLParamHeight(_h: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_SetLParamHeight(FjEnv, FjObject, _h);
end;

function jsRecyclerView.GetLParamWidth(): integer;
begin
  //in designing component state: result value here...
  if FInitialized then
   Result:= jsRecyclerView_GetLParamWidth(FjEnv, FjObject);
end;

function jsRecyclerView.GetLParamHeight(): integer;
begin
  //in designing component state: result value here...
  if FInitialized then
   Result:= jsRecyclerView_GetLParamHeight(FjEnv, FjObject);
end;

procedure jsRecyclerView.SetLGravity(_gravity: TLayoutGravity);
begin
  //in designing component state: set value here...
  FGravityInParent:= _gravity;
  if FInitialized then
     jsRecyclerView_SetLGravity(FjEnv, FjObject, Ord(FGravityInParent));
end;

procedure jsRecyclerView.SetLWeight(_w: single);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_SetLWeight(FjEnv, FjObject, _w);
end;

procedure jsRecyclerView.SetLeftTopRightBottomWidthHeight(_left: integer; _top: integer; _right: integer; _bottom: integer; _w: integer; _h: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_SetLeftTopRightBottomWidthHeight(FjEnv, FjObject, _left ,_top ,_right ,_bottom ,_w ,_h);
end;

procedure jsRecyclerView.AddLParamsAnchorRule(_rule: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_AddLParamsAnchorRule(FjEnv, FjObject, _rule);
end;

procedure jsRecyclerView.AddLParamsParentRule(_rule: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_AddLParamsParentRule(FjEnv, FjObject, _rule);
end;

procedure jsRecyclerView.SetLayoutAll(_idAnchor: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_SetLayoutAll(FjEnv, FjObject, _idAnchor);
end;

procedure jsRecyclerView.ClearLayoutAll();
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_ClearLayoutAll(FjEnv, FjObject);
end;

procedure jsRecyclerView.SetId(_id: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_SetId(FjEnv, FjObject, _id);
end;

procedure jsRecyclerView.SetItemContentFormat(_delimitedContentFormat: string; _delimiter: string);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_SetItemContentDictionary(FjEnv, FjObject, _delimitedContentFormat ,_delimiter);
end;

procedure jsRecyclerView.SetItemContentFormat(_contentFormat: string);
begin
   SetItemContentFormat(_contentFormat, '|');
end;

procedure jsRecyclerView.Add(_delimitedContent: string);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_Add(FjEnv, FjObject, _delimitedContent);
end;

function jsRecyclerView.GetSelectedContent(_contentIndex: integer): string;
begin
  //in designing component state: result value here...
  if FInitialized then
   Result:= jsRecyclerView_GetSelectedContent(FjEnv, FjObject, _contentIndex);
end;

procedure jsRecyclerView.SetItemContentLayout(_itemViewLayout: jObject);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_SetlayoutView(FjEnv, FjObject, _itemViewLayout);
end;

procedure jsRecyclerView.SetItemContentLayout(_itemViewLayout: jObject; _forceCardStyle: boolean);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_SetItemViewLayout(FjEnv, FjObject, _itemViewLayout ,_forceCardStyle);
end;

procedure jsRecyclerView.SetSeparatorDecorationColor(_color: TARGBColorBridge);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_SetSeparatorDecorationColor(FjEnv, FjObject,  GetARGB(FCustomColor, _color) );
end;

procedure jsRecyclerView.SetAppBarLayoutScrollingViewBehavior();
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_SetAppBarLayoutScrollingViewBehavior(FjEnv, FjObject);
end;

procedure jsRecyclerView.Remove(_position: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_Remove(FjEnv, FjObject, _position);
end;

function jsRecyclerView.GetItemCount(): integer;
begin
  //in designing component state: result value here...
  if FInitialized then
   Result:= jsRecyclerView_GetItemCount(FjEnv, FjObject);
end;

procedure jsRecyclerView.SetFitsSystemWindows(_value: boolean);
begin
  //in designing component state: set value here...
  FFitsSystemWindows:= _value;
  if FInitialized then
     jsRecyclerView_SetFitsSystemWindows(FjEnv, FjObject, _value);
end;

procedure jsRecyclerView.SetClipToPadding(_value: boolean);
begin
  //in designing component state: set value here...
  if FInitialized then
     jsRecyclerView_SetClipToPadding(FjEnv, FjObject, _value);
end;

{-------- jsRecyclerView_JNI_Bridge ----------}

{
function jsRecyclerView_jCreate(env: PJNIEnv;_Self: int64; this: jObject): jObject;
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].j:= _Self;
  jCls:= Get_gjClass(env);
  jMethod:= env^.GetMethodID(env, jCls, 'jsRecyclerView_jCreate', '(J)Ljava/lang/Object;');
  Result:= env^.CallObjectMethodA(env, this, jMethod, @jParams);
  Result:= env^.NewGlobalRef(env, Result);
end;
}

function jsRecyclerView_jCreate(env: PJNIEnv;_Self: int64; _mode: integer; _direction: integer; _cols: integer; this: jObject): jObject;
var
  jParams: array[0..3] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].j:= _Self;
  jParams[1].i:= _mode;
  jParams[2].i:= _direction;
  jParams[3].i:= _cols;
  jCls:= Get_gjClass(env);
  jMethod:= env^.GetMethodID(env, jCls, 'jsRecyclerView_jCreate', '(JIII)Ljava/lang/Object;');
  Result:= env^.CallObjectMethodA(env, this, jMethod, @jParams);
  Result:= env^.NewGlobalRef(env, Result);
end;



procedure jsRecyclerView_jFree(env: PJNIEnv; _jsrecyclerview: JObject);
var
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'jFree', '()V');
  env^.CallVoidMethod(env, _jsrecyclerview, jMethod);
  env^.DeleteLocalRef(env, jCls);
end;


procedure jsRecyclerView_SetViewParent(env: PJNIEnv; _jsrecyclerview: JObject; _viewgroup: jObject);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].l:= _viewgroup;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetViewParent', '(Landroid/view/ViewGroup;)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;


function jsRecyclerView_GetParent(env: PJNIEnv; _jsrecyclerview: JObject): jObject;
var
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'GetParent', '()Landroid/view/ViewGroup;');
  Result:= env^.CallObjectMethod(env, _jsrecyclerview, jMethod);
  env^.DeleteLocalRef(env, jCls);
end;


procedure jsRecyclerView_RemoveFromViewParent(env: PJNIEnv; _jsrecyclerview: JObject);
var
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'RemoveFromViewParent', '()V');
  env^.CallVoidMethod(env, _jsrecyclerview, jMethod);
  env^.DeleteLocalRef(env, jCls);
end;


function jsRecyclerView_GetView(env: PJNIEnv; _jsrecyclerview: JObject): jObject;
var
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'GetView', '()Landroid/view/View;');
  Result:= env^.CallObjectMethod(env, _jsrecyclerview, jMethod);
  env^.DeleteLocalRef(env, jCls);
end;


procedure jsRecyclerView_SetLParamWidth(env: PJNIEnv; _jsrecyclerview: JObject; _w: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _w;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetLParamWidth', '(I)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;


procedure jsRecyclerView_SetLParamHeight(env: PJNIEnv; _jsrecyclerview: JObject; _h: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _h;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetLParamHeight', '(I)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;


function jsRecyclerView_GetLParamWidth(env: PJNIEnv; _jsrecyclerview: JObject): integer;
var
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'GetLParamWidth', '()I');
  Result:= env^.CallIntMethod(env, _jsrecyclerview, jMethod);
  env^.DeleteLocalRef(env, jCls);
end;


function jsRecyclerView_GetLParamHeight(env: PJNIEnv; _jsrecyclerview: JObject): integer;
var
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'GetLParamHeight', '()I');
  Result:= env^.CallIntMethod(env, _jsrecyclerview, jMethod);
  env^.DeleteLocalRef(env, jCls);
end;


procedure jsRecyclerView_SetLGravity(env: PJNIEnv; _jsrecyclerview: JObject; _g: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _g;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetLGravity', '(I)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;


procedure jsRecyclerView_SetLWeight(env: PJNIEnv; _jsrecyclerview: JObject; _w: single);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].f:= _w;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetLWeight', '(F)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;


procedure jsRecyclerView_SetLeftTopRightBottomWidthHeight(env: PJNIEnv; _jsrecyclerview: JObject; _left: integer; _top: integer; _right: integer; _bottom: integer; _w: integer; _h: integer);
var
  jParams: array[0..5] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _left;
  jParams[1].i:= _top;
  jParams[2].i:= _right;
  jParams[3].i:= _bottom;
  jParams[4].i:= _w;
  jParams[5].i:= _h;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetLeftTopRightBottomWidthHeight', '(IIIIII)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;


procedure jsRecyclerView_AddLParamsAnchorRule(env: PJNIEnv; _jsrecyclerview: JObject; _rule: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _rule;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'AddLParamsAnchorRule', '(I)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;


procedure jsRecyclerView_AddLParamsParentRule(env: PJNIEnv; _jsrecyclerview: JObject; _rule: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _rule;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'AddLParamsParentRule', '(I)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;


procedure jsRecyclerView_SetLayoutAll(env: PJNIEnv; _jsrecyclerview: JObject; _idAnchor: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _idAnchor;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetLayoutAll', '(I)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;


procedure jsRecyclerView_ClearLayoutAll(env: PJNIEnv; _jsrecyclerview: JObject);
var
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'ClearLayoutAll', '()V');
  env^.CallVoidMethod(env, _jsrecyclerview, jMethod);
  env^.DeleteLocalRef(env, jCls);
end;


procedure jsRecyclerView_SetId(env: PJNIEnv; _jsrecyclerview: JObject; _id: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _id;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetId', '(I)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;

procedure jsRecyclerView_SetItemContentDictionary(env: PJNIEnv; _jsrecyclerview: JObject; _delimitedContentDictionary: string; _delimiter: string);
var
  jParams: array[0..1] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].l:= env^.NewStringUTF(env, PChar(_delimitedContentDictionary));
  jParams[1].l:= env^.NewStringUTF(env, PChar(_delimiter));
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetItemContentDictionary', '(Ljava/lang/String;Ljava/lang/String;)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
env^.DeleteLocalRef(env,jParams[0].l);
  env^.DeleteLocalRef(env,jParams[1].l);
  env^.DeleteLocalRef(env, jCls);
end;


procedure jsRecyclerView_Add(env: PJNIEnv; _jsrecyclerview: JObject; _delimitedContent: string);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].l:= env^.NewStringUTF(env, PChar(_delimitedContent));
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'Add', '(Ljava/lang/String;)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
env^.DeleteLocalRef(env,jParams[0].l);
  env^.DeleteLocalRef(env, jCls);
end;


function jsRecyclerView_GetSelectedContent(env: PJNIEnv; _jsrecyclerview: JObject; _contentIndex: integer): string;
var
  jStr: JString;
  jBoo: JBoolean;
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _contentIndex;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'GetSelectedContent', '(I)Ljava/lang/String;');
  jStr:= env^.CallObjectMethodA(env, _jsrecyclerview, jMethod, @jParams);
  case jStr = nil of
     True : Result:= '';
     False: begin
              jBoo:= JNI_False;
              Result:= string( env^.GetStringUTFChars(env, jStr, @jBoo));
            end;
  end;
  env^.DeleteLocalRef(env, jCls);
end;

procedure jsRecyclerView_SetlayoutView(env: PJNIEnv; _jsrecyclerview: JObject; _itemViewLayout: jObject);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].l:= _itemViewLayout;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetItemViewLayout', '(Landroid/view/View;)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;

procedure jsRecyclerView_SetItemViewLayout(env: PJNIEnv; _jsrecyclerview: JObject; _itemViewLayout: jObject; _forceCardStyle: boolean);
var
  jParams: array[0..1] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].l:= _itemViewLayout;
  jParams[1].z:= JBool(_forceCardStyle);
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetItemViewLayout', '(Landroid/view/View;Z)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;

procedure jsRecyclerView_SetSeparatorDecorationColor(env: PJNIEnv; _jsrecyclerview: JObject; _separatorColor: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _separatorColor;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetSeparatorDecorationColor', '(I)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;

procedure jsRecyclerView_SetAppBarLayoutScrollingViewBehavior(env: PJNIEnv; _jsrecyclerview: JObject);
var
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetAppBarLayoutScrollingViewBehavior', '()V');
  env^.CallVoidMethod(env, _jsrecyclerview, jMethod);
  env^.DeleteLocalRef(env, jCls);
end;

procedure jsRecyclerView_Remove(env: PJNIEnv; _jsrecyclerview: JObject; _position: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _position;
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'Remove', '(I)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;

function jsRecyclerView_GetItemCount(env: PJNIEnv; _jsrecyclerview: JObject): integer;
var
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'GetItemCount', '()I');
  Result:= env^.CallIntMethod(env, _jsrecyclerview, jMethod);
  env^.DeleteLocalRef(env, jCls);
end;

procedure jsRecyclerView_SetFitsSystemWindows(env: PJNIEnv; _jsrecyclerview: JObject; _value: boolean);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].z:= JBool(_value);
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetFitsSystemWindows', '(Z)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;

procedure jsRecyclerView_SetClipToPadding(env: PJNIEnv; _jsrecyclerview: JObject; _value: boolean);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].z:= JBool(_value);
  jCls:= env^.GetObjectClass(env, _jsrecyclerview);
  jMethod:= env^.GetMethodID(env, jCls, 'SetClipToPadding', '(Z)V');
  env^.CallVoidMethodA(env, _jsrecyclerview, jMethod, @jParams);
  env^.DeleteLocalRef(env, jCls);
end;


end.
