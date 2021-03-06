USE [CRM]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 07/08/2017 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[ParentID] [int] NULL,
	[Url] [nvarchar](100) NULL,
	[Icon] [nvarchar](100) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Menu] ON
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (1, N'营销管理', 0, NULL, N'icon-caozuo')
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (2, N'客户管理', 0, NULL, N'icon-biaodan')
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (3, N'服务管理', 0, NULL, N'icon-iconfontfuwu')
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (4, N'系统管理', 0, NULL, N'icon-xitong')
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (5, N'销售机会管理', 1, N'Sale/Salechance.htm', NULL)
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (6, N'销售机会分配', 1, N'Sale/SaleAllot.htm', NULL)
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (7, N'客户开发计划', 1, N'Sale/SaleManager.htm', NULL)
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (8, N'客户信息管理', 2, N'Customer/CustomerPage.htm', NULL)
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (9, N'客户流失管理', 2, N'Customer/LostsPage.htm', NULL)
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (10, N'服务创建', 3, N'CustomerService/ServiceCreate.htm', NULL)
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (11, N'服务分配', 3, N'CustomerService/ServiceAllot.htm', NULL)
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (12, N'服务处理', 3, N'CustomerService/ServiceDispose.htm', NULL)
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (13, N'服务反馈', 3, N'CustomerService/ServiceResult.htm', NULL)
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (14, N'服务归档', 3, N'CustomerService/serviceDetail.htm', NULL)
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (15, N'用户管理', 4, N'Manager/UserManager.htm', NULL)
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (16, N'角色管理', 4, N'Manager/RoleManager.htm', NULL)
INSERT [dbo].[Menu] ([ID], [MenuName], [ParentID], [Url], [Icon]) VALUES (17, N'权限管理', 4, N'Manager/PowerManager.htm', NULL)
SET IDENTITY_INSERT [dbo].[Menu] OFF
/****** Object:  Table [dbo].[Measures]    Script Date: 07/08/2017 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measures](
	[MeID] [int] IDENTITY(1,1) NOT NULL,
	[CLID] [int] NULL,
	[MeDate] [datetime] NULL,
	[MeDesc] [nvarchar](max) NULL,
 CONSTRAINT [PK_MEASURES] PRIMARY KEY CLUSTERED 
(
	[MeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LinkMans]    Script Date: 07/08/2017 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LinkMans](
	[LMID] [int] IDENTITY(1,1) NOT NULL,
	[CusID] [int] NULL,
	[LMName] [nvarchar](50) NULL,
	[LMSex] [char](2) NULL,
	[LMDuty] [nvarchar](50) NULL,
	[LMMobileNo] [varchar](50) NULL,
	[LMOfficeNo] [varchar](50) NULL,
	[LMMemo] [nvarchar](500) NULL,
 CONSTRAINT [PK_LINKMANS] PRIMARY KEY CLUSTERED 
(
	[LMID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[LinkMans] ON
INSERT [dbo].[LinkMans] ([LMID], [CusID], [LMName], [LMSex], [LMDuty], [LMMobileNo], [LMOfficeNo], [LMMemo]) VALUES (1, 1, N'丁局长', N'  ', N'', N'10010', N'', N'')
INSERT [dbo].[LinkMans] ([LMID], [CusID], [LMName], [LMSex], [LMDuty], [LMMobileNo], [LMOfficeNo], [LMMemo]) VALUES (2, 2, N'陈老板', N'  ', N'', N'123123', N'', N'')
INSERT [dbo].[LinkMans] ([LMID], [CusID], [LMName], [LMSex], [LMDuty], [LMMobileNo], [LMOfficeNo], [LMMemo]) VALUES (3, 3, N'邹胖子', N'  ', N'', N'10086', N'', N'')
INSERT [dbo].[LinkMans] ([LMID], [CusID], [LMName], [LMSex], [LMDuty], [LMMobileNo], [LMOfficeNo], [LMMemo]) VALUES (4, 4, N'陈经理', N'  ', N'', N'15612345678', N'', N'')
SET IDENTITY_INSERT [dbo].[LinkMans] OFF
/****** Object:  Table [dbo].[CustomServices]    Script Date: 07/08/2017 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomServices](
	[CSID] [int] IDENTITY(1,1) NOT NULL,
	[STID] [int] NULL,
	[CusID] [int] NULL,
	[CSTitle] [nvarchar](100) NULL,
	[CSState] [int] NULL,
	[CSDesc] [nvarchar](max) NULL,
	[CSCreateID] [int] NULL,
	[CSCreateDate] [datetime] NULL,
	[CSDueID] [int] NULL,
	[CSDueDate] [datetime] NULL,
	[CSDeal] [nvarchar](500) NULL,
	[CSDealDate] [datetime] NULL,
	[CSResult] [nvarchar](500) NULL,
	[CSSatisfy] [int] NULL,
 CONSTRAINT [PK_CUSTOMSERVICES] PRIMARY KEY CLUSTERED 
(
	[CSID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomServices] ON
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (1, 2, 1, N'asdas', 1, N'fasfas', 1, CAST(0x0000A7A60135A51F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (2, 2, 2, N'asdas', 1, N'fasfas', 1, CAST(0x0000A7A601364D47 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (3, 3, 2, N'asd', 1, N'asfasf', 1, CAST(0x0000A7A601384419 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (4, 1, 2, N'asdas', 1, N'fasfas', 1, CAST(0x0000A7A601393DA4 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (5, 2, 2, N'asczxczx', 1, N'asfasfzxcv', 1, CAST(0x0000A7A6013B2A6D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (6, 2, 3, N'zcxzc', 1, N'vasfasf', 1, CAST(0x0000A7A6013BB097 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (7, 2, 4, N'asd', 1, N'asfas', 1, CAST(0x0000A7A6013C2EDD AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (8, 2, 3, N'asfasczx', 1, N'asfasfas', 1, CAST(0x0000A7A6013C3764 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (9, 3, 1, N'asdfas', 1, N'fasfasfas', 1, CAST(0x0000A7A6013C3EBF AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (10, 2, 2, N'asfasf', 1, N'asfasfas', 1, CAST(0x0000A7A6013C5B00 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (11, 2, 3, N'asd', 1, N'asfasfas', 1, CAST(0x0000A7A6013C81AE AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (12, 2, 2, N'asdas', 1, N'dfasfas', 1, CAST(0x0000A7A6013CFE91 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (13, 2, 2, N'asd', 1, N'asdfasfas', 1, CAST(0x0000A7A6013DA88F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (14, 2, 2, N'asdas', 1, N'fasfas', 1, CAST(0x0000A7A6013E6206 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (21, 2, 3, N'asd', 1, N'asdfasfas', 1, CAST(0x0000A7A6013F0EE1 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (29, 2, 2, N'asd', 1, N'dasd', 1, CAST(0x0000A7A6013F7784 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (31, 2, 2, N'asd', 1, N'asfasfasfasfas', 1, CAST(0x0000A7A60142AF6C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (35, 2, 2, N'asd', 1, N'zxczxvzx', 1, CAST(0x0000A7A60143E2AF AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (36, 2, 3, N'asdas', 1, N'fasfasfasf', 1, CAST(0x0000A7A6014402F4 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (37, 2, 2, N'asdsad', 1, N'asdasdasdasdasd', 1, CAST(0x0000A7A6014439DF AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (38, 1, 3, N'zxczxv', 1, N'asdasdasdasdas', 1, CAST(0x0000A7A601446E14 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (39, 1, 3, N'asd', 1, N'asdasfas', 1, CAST(0x0000A7A60144A505 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (40, 1, 2, N'a', 1, N'a', 1, CAST(0x0000A7A60144DD04 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (41, 2, 3, N'asd', 1, N'asdasdasfasfas', 1, CAST(0x0000A7A60145AE37 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (45, 2, 2, N'sdzxvzxvzxv', 1, N'zxvfasfdfqwrfqw', 1, CAST(0x0000A7A6014695D1 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (54, 2, 3, N'asd', 1, N'asdas', 1, CAST(0x0000A7A60148BA3B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (71, 2, 3, N'asd', 1, N'asfas', 1, CAST(0x0000A7A601509287 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (79, 2, 2, N'asd', 2, N'asdasf', 1, CAST(0x0000A7A601513E2C AS DateTime), 4, CAST(0x0000A7A601674786 AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (81, 2, 3, N'asdasf', 4, N'asfasfas', 1, CAST(0x0000A7A60151469A AS DateTime), 4, CAST(0x0000A7A6017ED5DD AS DateTime), N'sdafasfasf', CAST(0x0000A7A7014FA4DE AS DateTime), N'asdasfaf', 5)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (126, 2, 3, N'assasaf', 4, N'safasfasf', 1, CAST(0x0000A7A700952F8E AS DateTime), 1, CAST(0x0000A7A700A5E104 AS DateTime), N'sffqwrwqeadascscas', CAST(0x0000A7A700B856CA AS DateTime), N'fasfasfasfas', 5)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (134, 2, 4, N'asd', 1, N'asfas', 1, CAST(0x0000A7A700953BE7 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (135, NULL, NULL, NULL, NULL, N'1', 1, CAST(0x0000A7A700965E1A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (136, NULL, NULL, NULL, NULL, N'1', 1, CAST(0x0000A7A7009662A9 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (137, NULL, NULL, NULL, NULL, N'1', 1, CAST(0x0000A7A700966357 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (138, NULL, NULL, NULL, NULL, N'1', 1, CAST(0x0000A7A70096638B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (139, NULL, NULL, NULL, NULL, N'1', 1, CAST(0x0000A7A7009663BE AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (140, NULL, NULL, NULL, NULL, N'1', 1, CAST(0x0000A7A7009663ED AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (141, NULL, NULL, NULL, NULL, N'1', 1, CAST(0x0000A7A700966424 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (142, NULL, NULL, NULL, NULL, N'1', 1, CAST(0x0000A7A700966452 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (143, NULL, NULL, NULL, NULL, N'1', 1, CAST(0x0000A7A70096648B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (144, NULL, NULL, NULL, NULL, N'1', 1, CAST(0x0000A7A7009664BD AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (145, NULL, NULL, NULL, NULL, N'1', 1, CAST(0x0000A7A7009664F1 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (146, NULL, NULL, NULL, NULL, N'1', 1, CAST(0x0000A7A700966525 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (155, 1, 3, N'aa', 4, N'bb', 1, CAST(0x0000A7A7009846BC AS DateTime), 1, CAST(0x0000A7A700A5DCBF AS DateTime), N'cccccc', CAST(0x0000A7A700B82DEF AS DateTime), N'asdasfasf', 1)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (156, 1, 2, N'aa', 1, N'bb', 1, CAST(0x0000A7A700984FB8 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (157, 1, 3, N'aaf', 1, N'adsfdsfds', 1, CAST(0x0000A7A70098578E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (158, 1, 1, N'fsdafsda', 1, N'fsadfads', 1, CAST(0x0000A7A700985EBA AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (159, 1, 1, N'fsdfs', 1, N'afsdfsd', 1, CAST(0x0000A7A70098745E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (160, 1, 2, N'fdsf', 1, N'sdafads', 1, CAST(0x0000A7A7009879CF AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (161, 1, 2, N'fdsf', 1, N'sadfasd', 1, CAST(0x0000A7A700987FA0 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (162, 2, 3, N'fsdf', 4, N'dsafds', 1, CAST(0x0000A7A700988754 AS DateTime), 1, CAST(0x0000A7A701455077 AS DateTime), N'sdgsdgsdgsdg', CAST(0x0000A7A70145572F AS DateTime), N'asdasdasdasdas', 4)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (163, 1, 1, N'fasdf', 1, N'adsfds', 1, CAST(0x0000A7A70098A6DE AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (175, 1, 1, N'dad', 2, N'da', 1, CAST(0x0000A7A70099428A AS DateTime), 1, CAST(0x0000A7A7013E0415 AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (178, 1, 1, N'qq', 1, N'rr', 1, CAST(0x0000A7A7009AD71B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (181, 1, 3, N'gg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (183, 1, 2, N'asd', 2, N'asfa', 1, CAST(0x0000A7A7009DD9EB AS DateTime), 1, CAST(0x0000A7A7013DFCB8 AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (184, 1, 3, N'as', 1, N'asfas', 1, CAST(0x0000A7A7009DDF99 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (185, 2, 1, N'asfas', 1, N'fasfasfa', 1, CAST(0x0000A7A7009DF431 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (186, 2, 1, N'as', 3, N'ssss', 1, CAST(0x0000A7A7009F0988 AS DateTime), 1, CAST(0x0000A7A700C45191 AS DateTime), N'xcvbsdgbsdvb dsvbsd', CAST(0x0000A7A7013DF70E AS DateTime), NULL, NULL)
INSERT [dbo].[CustomServices] ([CSID], [STID], [CusID], [CSTitle], [CSState], [CSDesc], [CSCreateID], [CSCreateDate], [CSDueID], [CSDueDate], [CSDeal], [CSDealDate], [CSResult], [CSSatisfy]) VALUES (187, 1, 2, N'fasdf', 3, N'sdfds', 1, CAST(0x0000A7A7009F2AA8 AS DateTime), 1, CAST(0x0000A7A7013DD698 AS DateTime), N'sdbaskdbkasdasfasfasfasf', CAST(0x0000A7A7013DF2EC AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[CustomServices] OFF
/****** Object:  Table [dbo].[CustomLosts]    Script Date: 07/08/2017 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomLosts](
	[CLID] [int] IDENTITY(1,1) NOT NULL,
	[CusID] [int] NULL,
	[CLOrderDate] [datetime] NULL,
	[CLDate] [datetime] NULL,
	[CLMeasures] [nvarchar](max) NULL,
	[CLEnterDate] [datetime] NULL,
	[CLReason] [nvarchar](500) NULL,
	[CLState] [int] NULL,
 CONSTRAINT [PK_CUSTOMLOSTS] PRIMARY KEY CLUSTERED 
(
	[CLID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomLosts] ON
INSERT [dbo].[CustomLosts] ([CLID], [CusID], [CLOrderDate], [CLDate], [CLMeasures], [CLEnterDate], [CLReason], [CLState]) VALUES (13, 1, CAST(0x0000A5CC00EF8530 AS DateTime), CAST(0x0000A73D00FA50F6 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[CustomLosts] ([CLID], [CusID], [CLOrderDate], [CLDate], [CLMeasures], [CLEnterDate], [CLReason], [CLState]) VALUES (14, 3, CAST(0x0000A5CC00EFE7A0 AS DateTime), CAST(0x0000A73D00FA50F6 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[CustomLosts] ([CLID], [CusID], [CLOrderDate], [CLDate], [CLMeasures], [CLEnterDate], [CLReason], [CLState]) VALUES (15, 4, CAST(0x0000A5CC00EFED7C AS DateTime), CAST(0x0000A73D00FA50F6 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[CustomLosts] ([CLID], [CusID], [CLOrderDate], [CLDate], [CLMeasures], [CLEnterDate], [CLReason], [CLState]) VALUES (16, 2, CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A7A900145A85 AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[CustomLosts] OFF
/****** Object:  Table [dbo].[Customers]    Script Date: 07/08/2017 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CusID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CusName] [nvarchar](50) NULL,
	[CusAddress] [nvarchar](100) NULL,
	[CusZip] [varchar](50) NULL,
	[CusFax] [varchar](50) NULL,
	[CusWebsite] [varchar](100) NULL,
	[CusLicenceNo] [varchar](50) NULL,
	[CusChieftain] [nvarchar](50) NULL,
	[CusBankroll] [int] NULL,
	[CusTurnover] [int] NULL,
	[CusBank] [nvarchar](50) NULL,
	[CusBankNo] [varchar](50) NULL,
	[CusLocalTaxNo] [varchar](50) NULL,
	[CusNationalTaxNo] [varchar](50) NULL,
	[CusDate] [datetime] NULL,
	[CusState] [int] NULL,
 CONSTRAINT [PK_CUSTOMERS] PRIMARY KEY CLUSTERED 
(
	[CusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON
INSERT [dbo].[Customers] ([CusID], [UserID], [CusName], [CusAddress], [CusZip], [CusFax], [CusWebsite], [CusLicenceNo], [CusChieftain], [CusBankroll], [CusTurnover], [CusBank], [CusBankNo], [CusLocalTaxNo], [CusNationalTaxNo], [CusDate], [CusState]) VALUES (1, 3, N'长沙市电业局', N'', N'', N'', N'', N'', N'', NULL, NULL, N'', N'', N'', N'', CAST(0x0000A73900EF856E AS DateTime), 1)
INSERT [dbo].[Customers] ([CusID], [UserID], [CusName], [CusAddress], [CusZip], [CusFax], [CusWebsite], [CusLicenceNo], [CusChieftain], [CusBankroll], [CusTurnover], [CusBank], [CusBankNo], [CusLocalTaxNo], [CusNationalTaxNo], [CusDate], [CusState]) VALUES (2, 3, N'中电软件园', N'', N'', N'', N'', N'', N'', NULL, NULL, N'', N'', N'', N'', CAST(0x0000A73900EFE3A8 AS DateTime), 1)
INSERT [dbo].[Customers] ([CusID], [UserID], [CusName], [CusAddress], [CusZip], [CusFax], [CusWebsite], [CusLicenceNo], [CusChieftain], [CusBankroll], [CusTurnover], [CusBank], [CusBankNo], [CusLocalTaxNo], [CusNationalTaxNo], [CusDate], [CusState]) VALUES (3, 4, N'华瑞IT教育', N'', N'', N'', N'', N'', N'', NULL, NULL, N'', N'', N'', N'', CAST(0x0000A73900EFE839 AS DateTime), 1)
INSERT [dbo].[Customers] ([CusID], [UserID], [CusName], [CusAddress], [CusZip], [CusFax], [CusWebsite], [CusLicenceNo], [CusChieftain], [CusBankroll], [CusTurnover], [CusBank], [CusBankNo], [CusLocalTaxNo], [CusNationalTaxNo], [CusDate], [CusState]) VALUES (4, 1, N'中电软件园园区餐厅', N'', N'', N'', N'', N'', N'', NULL, NULL, N'', N'', N'', N'', CAST(0x0000A73900EFED7C AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Customers] OFF
/****** Object:  Table [dbo].[Chances]    Script Date: 07/08/2017 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chances](
	[ChanID] [int] IDENTITY(1,1) NOT NULL,
	[ChanName] [nvarchar](50) NULL,
	[ChanRate] [int] NULL,
	[ChanLinkMan] [nvarchar](50) NULL,
	[ChanLinkTel] [varchar](50) NULL,
	[ChanTitle] [nvarchar](500) NULL,
	[ChanDesc] [nvarchar](2000) NULL,
	[ChanCreateMan] [int] NULL,
	[ChanCreateDate] [datetime] NULL,
	[ChanDueMan] [int] NULL,
	[ChanDueDate] [datetime] NULL,
	[ChanState] [int] NULL,
	[ChanError] [nvarchar](500) NULL,
 CONSTRAINT [PK_CHANCES] PRIMARY KEY CLUSTERED 
(
	[ChanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Chances] ON
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (2, N'中电软件园园区餐厅', 80, N'陈经理', N'15612345678', N'有意向采购餐桌5张', N'需要5张豪华包厢专用的餐桌', 3, CAST(0x0000A72F00EB74DA AS DateTime), 2, CAST(0x0000A7A10141F6AD AS DateTime), 2, NULL)
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (3, N'华瑞IT教育', 50, N'邹胖子', N'10086', N'有意向采购电脑100台', N'用于新建两个机房', 1, CAST(0x0000A72F00EC00D2 AS DateTime), 3, CAST(0x0000A7A10141FA36 AS DateTime), 2, NULL)
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (4, N'长沙市电业局', 70, N'丁局长', N'10010', N'有意向采购电塔基坐2座', N'有意向采购电塔基坐2座', 2, CAST(0x0000A72F00EC56F1 AS DateTime), 3, CAST(0x0000A7A10141F300 AS DateTime), 2, NULL)
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (5, N'中电软件园', 100, N'陈老板', N'123123', N'购单车100台', N'购单车100台', 1, CAST(0x0000A732009E5AD9 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (6, N'美国白宫', 100, N'川普1', N'911', N'买屎', N'买屎', 2, CAST(0x0000A73200A0958C AS DateTime), NULL, NULL, 4, N'请在这里输入失败原因...')
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (13, N'华瑞IT教育', 100, N'邱先生', N'17711618919', N'无意装逼', N'无形装逼，最为致命', 3, CAST(0x0000A79C0188F418 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (14, N'天地人民银行', 50, N'程の杰杰', N'16946996469', N'请求设计一整套网页', N'钱钱钱钱钱啊啊啊啊啊', 2, CAST(0x0000A79C0189764B AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (15, N'腾讯', 100, N'麻瓜藤', N'100000', N'用Q币换人民币', N'机不可失失不再来，2:1比率贱卖了啊', 3, CAST(0x0000A79C0189CE50 AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (19, N'1', 100, N'11', N'111', N'11', N'1111', 1, CAST(0x0000A79E00988DF0 AS DateTime), 4, CAST(0x0000A7A10141EA76 AS DateTime), 2, NULL)
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (22, N'aa', 100, N'aa', N'1111', N'asfsafasfasf', N'asfasfsafasfasfas', 1, CAST(0x0000A79F00B49AAC AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (23, N'盛大', 100, N'啊啊啊', N'13322332233', N'asdasdasdasfsafasfasfsafa', N'safsafasfasfasfasfasfasfsafasfa', 1, CAST(0x0000A79F00BD2C96 AS DateTime), NULL, NULL, 4, N'客户未回应')
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (24, N'华为', 100, N'任正非', N'123123123123', N'订购手机零件1000000件', N'大生意大生意大生意大生意大生意大生意大生意大生意', 1, CAST(0x0000A79F00BD5F34 AS DateTime), NULL, NULL, 3, NULL)
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (25, N'狗屎文化无限企业', 100, N'二狗子', N'13804379438', N'订购订购订购订购', N'阿萨达撒大赛大所大所多啥大啥奥所大所大所大所多啥大大所大所大所大所大所大所多啥大所多啥多所', 1, CAST(0x0000A7A101332597 AS DateTime), 1, CAST(0x0000A7A10141C9C4 AS DateTime), 3, NULL)
INSERT [dbo].[Chances] ([ChanID], [ChanName], [ChanRate], [ChanLinkMan], [ChanLinkTel], [ChanTitle], [ChanDesc], [ChanCreateMan], [ChanCreateDate], [ChanDueMan], [ChanDueDate], [ChanState], [ChanError]) VALUES (26, N'bb', 80, N'邱雪琪', N'17711618919', N'奥斯丁', N'爱神的箭啊搜到静安沙发沙发是', 1, CAST(0x0000A7A60147B898 AS DateTime), NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Chances] OFF
/****** Object:  Table [dbo].[Activitys]    Script Date: 07/08/2017 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activitys](
	[ActID] [int] IDENTITY(1,1) NOT NULL,
	[CusID] [int] NULL,
	[ActDate] [datetime] NULL,
	[ActAdd] [nvarchar](100) NULL,
	[ActTitle] [nvarchar](100) NULL,
	[ActMemo] [nvarchar](100) NULL,
	[ActDesc] [nvarchar](max) NULL,
 CONSTRAINT [PK_ACTIVITYS] PRIMARY KEY CLUSTERED 
(
	[ActID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Activitys] ON
INSERT [dbo].[Activitys] ([ActID], [CusID], [ActDate], [ActAdd], [ActTitle], [ActMemo], [ActDesc]) VALUES (1, 1, CAST(0x0000A5CC00EF8530 AS DateTime), N'', N'有意向采购电塔基坐2座', N'', N'有意向采购电塔基坐2座')
INSERT [dbo].[Activitys] ([ActID], [CusID], [ActDate], [ActAdd], [ActTitle], [ActMemo], [ActDesc]) VALUES (2, 2, CAST(0x0000A5CC00EFE2F0 AS DateTime), N'', N'购单车100台', N'', N'购单车100台')
INSERT [dbo].[Activitys] ([ActID], [CusID], [ActDate], [ActAdd], [ActTitle], [ActMemo], [ActDesc]) VALUES (3, 3, CAST(0x0000A5CC00EFE7A0 AS DateTime), N'', N'有意向采购电脑100台', N'', N'用于新建两个机房')
INSERT [dbo].[Activitys] ([ActID], [CusID], [ActDate], [ActAdd], [ActTitle], [ActMemo], [ActDesc]) VALUES (4, 4, CAST(0x0000A5CC00EFED7C AS DateTime), N'', N'有意向采购餐桌5张', N'', N'需要5张豪华包厢专用的餐桌')
INSERT [dbo].[Activitys] ([ActID], [CusID], [ActDate], [ActAdd], [ActTitle], [ActMemo], [ActDesc]) VALUES (5, 2, CAST(0x0000A70E00000000 AS DateTime), NULL, N'fdsfasd', NULL, N'fsdafs')
SET IDENTITY_INSERT [dbo].[Activitys] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 07/08/2017 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserLName] [varchar](50) NOT NULL,
	[UserLPWD] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserCode] [varchar](50) NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([UserID], [RoleID], [UserLName], [UserLPWD], [UserName], [UserCode]) VALUES (2, 2, N'bb', N'C4-CA-42-38-A0-B9-23-82-0D-CC-50-9A-6F-75-84-9B', N'李四', N'ls')
INSERT [dbo].[Users] ([UserID], [RoleID], [UserLName], [UserLPWD], [UserName], [UserCode]) VALUES (3, 1, N'cc', N'C4-CA-42-38-A0-B9-23-82-0D-CC-50-9A-6F-75-84-9B', N'老大', N'ld')
INSERT [dbo].[Users] ([UserID], [RoleID], [UserLName], [UserLPWD], [UserName], [UserCode]) VALUES (4, 2, N'dd', N'C4-CA-42-38-A0-B9-23-82-0D-CC-50-9A-6F-75-84-9B', N'林志玲', N'lzl')
INSERT [dbo].[Users] ([UserID], [RoleID], [UserLName], [UserLPWD], [UserName], [UserCode]) VALUES (5, 1, N'admin', N'20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'邱雪琪', N'qxq')
INSERT [dbo].[Users] ([UserID], [RoleID], [UserLName], [UserLPWD], [UserName], [UserCode]) VALUES (6, 2, N'cdj', N'20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'程得杰', N'cdj')
INSERT [dbo].[Users] ([UserID], [RoleID], [UserLName], [UserLPWD], [UserName], [UserCode]) VALUES (7, 3, N'aaa', N'20-2C-B9-62-AC-59-07-5B-96-4B-07-15-2D-23-4B-70', N'王五', N'ww')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[ServiceType]    Script Date: 07/08/2017 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[STID] [int] IDENTITY(1,1) NOT NULL,
	[STName] [nvarchar](50) NULL,
 CONSTRAINT [PK_SERVICETYPE] PRIMARY KEY CLUSTERED 
(
	[STID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ServiceType] ON
INSERT [dbo].[ServiceType] ([STID], [STName]) VALUES (1, N'咨询')
INSERT [dbo].[ServiceType] ([STID], [STName]) VALUES (2, N'投诉')
INSERT [dbo].[ServiceType] ([STID], [STName]) VALUES (3, N'建议')
SET IDENTITY_INSERT [dbo].[ServiceType] OFF
/****** Object:  Table [dbo].[Role]    Script Date: 07/08/2017 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Role] ON
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (1, N'系统管理员')
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (2, N'销售主管')
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (3, N'客户经理')
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (5, N'厉害了我的哥')
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (6, N'承让了我的弟')
SET IDENTITY_INSERT [dbo].[Role] OFF
/****** Object:  Table [dbo].[Power]    Script Date: 07/08/2017 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Power](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[MenuID] [int] NULL,
 CONSTRAINT [PK_Power] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Power] ON
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (1, 1, 1)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (2, 1, 2)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (3, 1, 3)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (4, 1, 4)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (5, 1, 5)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (6, 1, 6)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (7, 1, 7)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (8, 1, 8)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (9, 1, 9)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (10, 1, 10)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (11, 1, 11)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (12, 1, 12)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (13, 1, 13)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (14, 1, 14)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (15, 1, 15)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (16, 1, 16)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (17, 1, 17)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (18, 2, 1)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (19, 2, 2)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (20, 2, 5)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (21, 2, 6)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (22, 2, 7)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (23, 2, 8)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (24, 2, 9)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (25, 3, 3)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (26, 3, 10)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (27, 3, 11)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (28, 3, 12)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (29, 3, 13)
INSERT [dbo].[Power] ([ID], [RoleID], [MenuID]) VALUES (30, 3, 14)
SET IDENTITY_INSERT [dbo].[Power] OFF
/****** Object:  Table [dbo].[Plans]    Script Date: 07/08/2017 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plans](
	[PlanID] [int] IDENTITY(1,1) NOT NULL,
	[ChanID] [int] NULL,
	[PlanDate] [datetime] NULL,
	[PlanContent] [nvarchar](1000) NULL,
	[PlanResultDate] [datetime] NULL,
	[PlanResult] [nvarchar](1000) NULL,
 CONSTRAINT [PK_PLANS] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Plans] ON
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (1, 6, CAST(0x0000A7360101EA70 AS DateTime), N'666', CAST(0x0000A73601083E43 AS DateTime), N'客户很满意')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (2, 6, CAST(0x0000A7360105AC85 AS DateTime), N'fasdfdasfdas', CAST(0x0000A73601082D7F AS DateTime), N'没结果')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (3, 15, CAST(0x0000A7360105CE86 AS DateTime), N'xxxxxxxxxxx', CAST(0x0000A736010848C8 AS DateTime), N'客户不在家')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (4, 6, CAST(0x0000A7360108518A AS DateTime), N'请在这里输入新计划...', CAST(0x0000A7360108546F AS DateTime), N'客户不在家')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (5, 24, CAST(0x0000A7A100C15A80 AS DateTime), N'啊啊啊', CAST(0x0000A7360108546F AS DateTime), N'asdas')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (6, 24, CAST(0x0000A7A100C221DF AS DateTime), N'我第二次', CAST(0x0000A7360108546F AS DateTime), N'asfasfasf')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (7, 24, CAST(0x0000A7A100C25643 AS DateTime), N'巴巴爸爸', CAST(0x0000A7360108546F AS DateTime), N'asfasfasfsaf')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (8, 24, CAST(0x0000A7A100C27DF1 AS DateTime), N'阿打算发', CAST(0x0000A7360108546F AS DateTime), N'asfsafasfasfas')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (9, 23, CAST(0x0000A7A100C2C71B AS DateTime), N'奥斯丁', CAST(0x0000A7360108546F AS DateTime), N'客户未回应')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (10, 23, CAST(0x0000A7A100C2CBFD AS DateTime), N'阿萨达撒', CAST(0x0000A7360108546F AS DateTime), N'客户未回应')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (11, 23, CAST(0x0000A7A100C2D139 AS DateTime), N'啊沙发撒', CAST(0x0000A7360108546F AS DateTime), N'客户未回应')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (12, 23, CAST(0x0000A7A100C311F7 AS DateTime), N'奥斯丁', CAST(0x0000A7360108546F AS DateTime), N'客户未回应')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (13, 24, CAST(0x0000A7A100C5BD6F AS DateTime), N'奥斯丁', CAST(0x0000A7360108546F AS DateTime), N'asfasfasfas')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (14, 2, CAST(0x0000A7A10137DECD AS DateTime), N'初步接触客户，了解需求', CAST(0x0000A7360108546F AS DateTime), N'已于客户联系成功，记录为文档')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (15, 25, CAST(0x0000A7A200986E8F AS DateTime), N'asdasdasdsad', CAST(0x0000A7A20098728B AS DateTime), N'sfasfasfasfa')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (16, 19, CAST(0x0000A7A60147DA9F AS DateTime), N'电话联系客户', CAST(0x0000A7A60147EAFC AS DateTime), N'联系成功')
INSERT [dbo].[Plans] ([PlanID], [ChanID], [PlanDate], [PlanContent], [PlanResultDate], [PlanResult]) VALUES (17, 19, CAST(0x0000A7A60147FD76 AS DateTime), N'到达对方公司访问', CAST(0x0000A7A6014807E7 AS DateTime), N'公司环境不错')
SET IDENTITY_INSERT [dbo].[Plans] OFF
/****** Object:  View [dbo].[v_users]    Script Date: 07/08/2017 16:53:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_users]
as 
 select u.*, r.RoleName from Users u left join Role r on u.RoleID=r.ID
GO
/****** Object:  View [dbo].[v_CustomServices]    Script Date: 07/08/2017 16:53:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_CustomServices]
as
select cs.*,c.CusName,u.UserName CSCreateMan,u2.UserName CSDueMan,st.STName
 from CustomServices cs
 left join Customers c on cs.CusID=c.CusID
 left join Users u on cs.CSCreateID=u.UserID
 left join Users u2 on cs.CSDueID=u2.UserID
 left join ServiceType st on cs.STID = st.STID
GO
/****** Object:  View [dbo].[v_customlosts]    Script Date: 07/08/2017 16:53:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_customlosts]
as
select a.*, c.CusName from customlosts a
left join customers c on a.cusid=c.cusid
GO
/****** Object:  View [dbo].[v_customers]    Script Date: 07/08/2017 16:53:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_customers]
as
select c.*, u.UserName from customers c
left join users u on c.userid=u.userid
GO
/****** Object:  View [dbo].[v_chances]    Script Date: 07/08/2017 16:53:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_chances] 
as
select c.*, isnull(u1.UserName, '') as ChanCreateManName 
	, isnull(u2.UserName, '') as ChanDueManName
from chances c
left join users u1 on c.ChanCreateMan=u1.UserID
left join users u2 on c.ChanDueMan=u2.UserID
GO
/****** Object:  StoredProcedure [dbo].[p_lost]    Script Date: 07/08/2017 16:53:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[p_lost]
as
begin
    insert into CustomLosts
    select CusID,Max(ActDate) LastDate  --,datediff(MM,Max(ActDate),getdate())
    ,getdate(), null, null, null, 1
    from Activitys group by CusID having datediff(MM,Max(ActDate),getdate()) >= 3
    and CusID not in (select CusID from Customers where CusState=2)
    and CusID not in (select CusID from CustomLosts)
end
GO
/****** Object:  Default [DF__Activitys__ActDa__0AD2A005]    Script Date: 07/08/2017 16:53:10 ******/
ALTER TABLE [dbo].[Activitys] ADD  CONSTRAINT [DF__Activitys__ActDa__0AD2A005]  DEFAULT (getdate()) FOR [ActDate]
GO
/****** Object:  Default [DF__Chances__ChanCre__7D78A4E7]    Script Date: 07/08/2017 16:53:10 ******/
ALTER TABLE [dbo].[Chances] ADD  DEFAULT (getdate()) FOR [ChanCreateDate]
GO
/****** Object:  Default [DF__Customers__CusDa__0519C6AF]    Script Date: 07/08/2017 16:53:10 ******/
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF__Customers__CusDa__0519C6AF]  DEFAULT (getdate()) FOR [CusDate]
GO
/****** Object:  Default [DF__Customers__CusSt__060DEAE8]    Script Date: 07/08/2017 16:53:10 ******/
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF__Customers__CusSt__060DEAE8]  DEFAULT ((1)) FOR [CusState]
GO
/****** Object:  Default [DF__CustomLos__CLDat__0DAF0CB0]    Script Date: 07/08/2017 16:53:10 ******/
ALTER TABLE [dbo].[CustomLosts] ADD  CONSTRAINT [DF__CustomLos__CLDat__0DAF0CB0]  DEFAULT (getdate()) FOR [CLDate]
GO
/****** Object:  Default [DF__Plans__PlanDate__00551192]    Script Date: 07/08/2017 16:53:10 ******/
ALTER TABLE [dbo].[Plans] ADD  CONSTRAINT [DF__Plans__PlanDate__00551192]  DEFAULT (getdate()) FOR [PlanDate]
GO
