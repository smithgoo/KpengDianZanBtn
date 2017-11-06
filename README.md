# KpengDianZanBtn
一个点赞的按钮 实现+1 动画上浮  图标动画过渡

KpengDianZanBtn *btn =[[KpengDianZanBtn alloc] initWithFrame:CGRectMake(100, 100, 100, 44)];
btn.title =@"123";
[self.view addSubview:btn];

btn.btnActionCallBack = ^(BOOL states,UIButton *sender) {
//网络请求在此处处理
if (states) {
[sender setTitle:[NSString stringWithFormat:@"%d",[btn.currentTitle intValue]+1] forState:UIControlStateNormal];
}

};

