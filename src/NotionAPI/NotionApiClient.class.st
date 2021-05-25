Class {
	#name : #NotionApiClient,
	#superclass : #Object,
	#instVars : [
		'access_token',
		'client'
	],
	#category : #NotionAPI
}

{ #category : #'instance creation' }
NotionApiClient class >> withAccessToken: aString [
	| c |
	c := NotionApiClient new.
	c access_token: aString.
	^ c
]

{ #category : #accessing }
NotionApiClient >> access_token [

	^ access_token
]

{ #category : #accessing }
NotionApiClient >> access_token: aString [
	access_token := aString.
	client headerAt: 'Authorization' put: 'Bearer ', access_token.
]

{ #category : #accessing }
NotionApiClient >> baseUrl [ 
	^ 'https://api.notion.com/v1/'
]

{ #category : #accessing }
NotionApiClient >> getDatabases [
	^ client get: (self baseUrl, 'databases')
]

{ #category : #initialization }
NotionApiClient >> initialize [ 
	client := ZnClient new.
	client headerAt: 'Notion-Version' put: '2021-05-13'
]
