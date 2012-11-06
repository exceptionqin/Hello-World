USE [v1_bip_data]
GO

CREATE SCHEMA [dw_knowledgebase] AUTHORIZATION [dbo]
GO


CREATE TABLE [dw_knowledgebase].[datasets](
	[SequenceId] [int] NOT NULL,
	[DataSetName] [nvarchar](200) NOT NULL,
	[DataSetID] [nvarchar](200) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[IsValid] [int] NOT NULL,
	[CreateUtcTime] [datetime2](7) NOT NULL,
	[LastUpdateUtcTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Datasets_SequenceId] PRIMARY KEY CLUSTERED 
(
	[SequenceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dw_knowledgebase].[shared_dimensions](
	[SequenceId] [int] NOT NULL,
	[SharedDimensionName] [nvarchar](200) NOT NULL,
	[SharedDimensionID] [nvarchar](200) NOT NULL,
	[IsValid] [int] NOT NULL,
	[CreateUtcTime] [datetime2](7) NOT NULL,
	[LastUpdateUtcTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_SharedDimension_SequenceId] PRIMARY KEY CLUSTERED 
(
	[SequenceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



CREATE TABLE [dw_knowledgebase].[datasets_dimensions](
	[SequenceId] [int] NOT NULL,
	[DataSetSequenceID] [int] NOT NULL,
	[DimensionName] [nvarchar](200) NOT NULL,
	[DimensionID] [nvarchar](200) NOT NULL,
	[SharedDimensionName] [nvarchar](200) NOT NULL,
	[Tag] [nvarchar](50) NOT NULL,
	[IsValid] [int] NOT NULL,
	[CreateUtcTime] [datetime2](7) NOT NULL,
	[LastUpdateUtcTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_DataSet_Dimension_SequenceId] PRIMARY KEY CLUSTERED 
(
	[SequenceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dw_knowledgebase].[datasets_measures](
	[SequenceId] [int] NOT NULL,
	[DataSetSequenceID] [int] NOT NULL,
	[MeasureName] [nvarchar](200) NOT NULL,
	[MeasureID] [nvarchar](200) NOT NULL,
	[MeasureGroupName] [nvarchar](200) NOT NULL,
	[Tag] [nvarchar](50) NOT NULL,
	[IsValid] [int] NOT NULL,
	[CreateUtcTime] [datetime2](7) NOT NULL,
	[LastUpdateUtcTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_DataSet_Measure_SequenceId] PRIMARY KEY CLUSTERED 
(
	[SequenceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dw_knowledgebase].[dimension_attributes](
	[SequenceId] [int] NOT NULL,
	[SharedDimensionSequenceID] [int] NOT NULL,
	[Tag] [nvarchar](50) NOT NULL,
	[SourceTag] [nvarchar](50) NOT NULL,
	[AttributeName] [nvarchar](200) NOT NULL,
	[IsKeyAttribute] [int]NOT NULL,
	[KeyColumns] [nvarchar](200) NOT NULL,
	[NameColumn] [nvarchar](200) NOT NULL,
	[IsValid] [int] NOT NULL,
	[CreateUtcTime] [datetime2](7) NOT NULL,
	[LastUpdateUtcTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Dimension_Attribute_SequenceId] PRIMARY KEY CLUSTERED 
(
	[SequenceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
